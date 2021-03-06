function pose_st=get_one_task(sub_id, task_id, task_iid, file_dir)
% sub_id: subject id (2-12)
% task_id: task id (1-25)
% task_iid: some tasks have a few repetition, and some have different 
%   viewing angles. (1-4)
% file_dir: where you unpack the zip file, e.g. 
%   "xx/working_posture_trc_mat"

%% Check Input
idk=(task_id<=25)&(sub_id<=12)&(task_iid<=4);
assert(idk==true, 'Input number out of range');
%% get full path
file_dir=fullfile(file_dir, ['sub', num_to_2char(sub_id)]);
file_name=[['sub', num_to_2char(sub_id)],'_',...
   num_to_2char(task_id), '_',  num_to_2char(task_iid),...
   '_trc.mat'];
file_path=fullfile(file_dir, file_name);
%% check file path
if ~exist(file_path)
    warning([file_path, ' does not exist']);
    pose_st.xyz_all={};
    return;
end
%% return pose structure
pose_st=load(file_path);