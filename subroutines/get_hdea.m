function [ hdea, hdeaM ] = get_hdea( E )

    disp('computing high-order DEA matrix...');

    [DEA, DEAM, ~, DE] = E2dea_fast(E);
    [hdea, hdeaM] = dea2hdea( DEA, DE );
    
    hdeaM = DEAM * hdeaM;
    
    % HDEA : P * P
    % HDEAM : 2M * P
    % P is the number of directed 2-edge path

end