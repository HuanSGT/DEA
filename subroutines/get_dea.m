function [ DEA,DEAM, DEAIM ] = get_dea( gen_flag,E,basename )
%GET_DEA load or compute dea matrix 
    if(gen_flag==0 || gen_flag==4 ) % network is generated by SBM, and DEA matrix is also computed by SBM
        disp('loading DEA matrix... ');
        fdea=sprintf('%s.aue',basename);
        Edea=importdata(fdea)+1; % Edge list of adjacency matrix of undirected edges    
        Ndea=max(max(Edea));
        DEA=sparse(Edea(:,1),Edea(:,2),ones(length(Edea),1),Ndea,Ndea); % Directed Edge Adjacency matrix
        fdeam=sprintf('%s.am',basename);
        Edeam=importdata(fdeam)+1;
        Na=max(max(E)); % Number of elements of adjacency matrix
        DEAM=sparse(Edeam(:,1),Edeam(:,2),ones(length(Edeam),1),Na,Ndea);
        DEAIM=[];
    else
        disp('computing DEA matrix...');
        [DEA,DEAM,DEAIM]=E2dea_fast(E); %compute DEA and DEAM matrix by MATLAB function
        %[DEA,DEAM]=E2dea(E);DEAIM=0; %compute DEA and DEAM matrix by MATLAB function
        %isequal(DEA, DEA2)
        %isequal(DEAM,DEAM2)
    end

end

