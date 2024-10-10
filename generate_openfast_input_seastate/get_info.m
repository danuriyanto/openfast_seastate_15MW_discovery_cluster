function [loc_info, Hs, Vhub, Tp, seed] = get_info(run_info)
    txt_info = split(run_info,'_');
    loc_info = [txt_info{1} ' ' txt_info{2}];
    Hs      = str2double(txt_info{6});
    Vhub    = str2double(txt_info{4});
    seed_a  = split(txt_info{12},'.');
    seed    = str2double(seed_a{1});
    Tp      = str2double(txt_info{8});
end