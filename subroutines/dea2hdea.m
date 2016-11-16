function [hdea, hdeaM] = dea2hdea(dea, DE)
    hM = sum( sum(dea) .* sum(dea,2)' ); % number of edges in hdea
    hdeaE = zeros(hM, 2); % hdea's edges
    
    sz = size(dea); twom = sz(1);
    %E = [floor((idx - 1) / n) + 1, mod(idx - 1, n) + 1];
    %sz = size(xs); m = sz(1);
    p = sum(sum(dea));
    dea(dea > 0.5) = 1:p;
    
    %Computing hdeam
    inds = find(dea);
    [is, ~] = ind2sub(size(dea), inds);
    hdeaM = sparse(is, (1:p)', ones(p,1), twom, p);
    
    
    
    nodes1 = DE(:,1);
    nodes2 = DE(:,2);
    
    %Computing hea's Edges
    cntE = 0;
    for i = 1:twom
        row = dea(i,:)';
        col = dea(:,i);
        is = find( row ); xs = row(row > 0);
        js = find( col ); ys = col(col > 0);
        [iss, jss] = ndgrid(is,js);
        [xss, yss] = ndgrid(xs,ys);
        iss = reshape(iss,[],1); jss = reshape(jss,[],1);
        xss = reshape(xss,[],1); yss = reshape(yss,[],1);
        idx = nodes1(iss) ~= nodes2(jss);
        nidx = sum(sum(idx));
        %size(yss)
        %size(yss(idx))
        %size(xss(idx))
        %nidx
        %nidx
        %size(yss)
        %size(xss)
        hdeaE(cntE + 1 : cntE + nidx, :) = [yss(idx), xss(idx)];
        cntE = cntE + nidx;
    end
    
    hdea = sparse(hdeaE(1:cntE,1), hdeaE(1:cntE,2), ones(cntE,1), p, p);
    
        
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %hdeaE'
    %dea
    %[is, js] = ind2sub(size(dea), inds);
    %[is,js]'

end