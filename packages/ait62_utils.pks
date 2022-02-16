create or replace package ait62_utils as

gc_collection_name      varchar2(200) := 'JOB_STATUS';

procedure analyze_dna_job(  p_dna_sequence      in varchar2,
                            p_app_id            in number,
                            p_pageid            in number,
                            p_app_session       in number,
                            p_coll_seq_id       in varchar2);


procedure analyze_dna_in_background(p_dna_sequence      in varchar2,
                                    p_app_id            in number,
                                    p_pageid            in number,
                                    p_app_session       in number);

end;
/