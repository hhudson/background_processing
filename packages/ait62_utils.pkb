create or replace package body ait62_utils as

procedure analyze_dna(p_dna_sequence    in varchar2) is
begin

    dbms_session.sleep(10);

    if upper(p_dna_sequence) = 'BAD' then
        raise_application_error(-20001,'The DNA Sequence was BAD');
    end if;
end analyze_dna;


procedure analyze_dna_job(  p_dna_sequence      in varchar2,
                            p_app_id            in number,
                            p_pageid            in number,
                            p_app_session       in number,
                            p_coll_seq_id     in varchar2) as

begin

    apex_session.attach (
        p_app_id     => p_app_id,
        p_page_id    => p_pageid,
        p_session_id => p_app_session );

    analyze_dna(p_dna_sequence => p_dna_sequence);

    apex_collection.update_member_attribute(
        p_collection_name   => gc_collection_name,
        p_seq               => p_coll_seq_id,
        p_attr_number       => 3,
        p_attr_value        => 'COMPLETE'
        );

    commit;
exception when others then
    apex_collection.update_member_attribute(
        p_collection_name   => gc_collection_name,
        p_seq               => p_coll_seq_id,
        p_attr_number       => 3,
        p_attr_value        => 'ERROR'
        );    

    apex_collection.update_member_attribute(
        p_collection_name   => gc_collection_name,
        p_seq               => p_coll_seq_id,
        p_attr_number       => 4,
        p_attr_value        => sqlerrm
        );    

    commit;    
end analyze_dna_job;


--  
-- 
-- creates a dbms_scheduler job to analyze DNA
procedure analyze_dna_in_background(p_dna_sequence      in varchar2,
                                    p_app_id            in number,
                                    p_pageid            in number,
                                    p_app_session       in number) as

l_job_name      varchar2(4000)  := 'AIT62_' || sys.dbms_scheduler.generate_job_name;
l_id            number;

begin

    if not apex_collection.collection_exists(p_collection_name    => gc_collection_name) then
        apex_collection.create_collection(p_collection_name    => gc_collection_name);
    end if;

    l_id := apex_collection.add_member( p_collection_name   => gc_collection_name,
                                        p_c001              => l_job_name,
                                        p_c002              => 'Analyze DNA',
                                        p_c003              => 'RUNNING');

    sys.dbms_scheduler.create_job (
        job_name        => l_job_name,
        job_type        => 'STORED_PROCEDURE',
        job_action      => 'ait62_utils.analyze_dna_job',
        number_of_arguments => 5,
        start_date      => SYSTIMESTAMP,
        enabled         => false
    );


    sys.dbms_scheduler.set_job_argument_value(  job_name => l_job_name,  
                                                argument_position => 1,
                                                argument_value => p_dna_sequence);

    sys.dbms_scheduler.set_job_argument_value(  job_name => l_job_name,  
                                                argument_position => 2,
                                                argument_value => p_app_id);

    sys.dbms_scheduler.set_job_argument_value(  job_name => l_job_name,  
                                                argument_position => 3,
                                                argument_value => p_pageid);

    sys.dbms_scheduler.set_job_argument_value(  job_name => l_job_name,  
                                                argument_position => 4,
                                                argument_value => p_app_session);

    sys.dbms_scheduler.set_job_argument_value(  job_name => l_job_name,  
                                                argument_position => 5,
                                                argument_value => l_id);  

    sys.dbms_scheduler.enable(l_job_name);                                                                                                                                                                                                                          


end analyze_dna_in_background;

end;
/