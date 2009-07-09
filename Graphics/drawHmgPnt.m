function drawHmgPnt(MapFig, Lmk, color)

% DRAWEUCLMK  Draw Homogeneous point landmark in MapFig.

global Map

posOffset = [0;0;.2];

% Homogeneous
hmg = Map.x(Lmk.state.r) ;
HMG = Map.P(Lmk.state.r,Lmk.state.r) ;

% Euclidean
[euc,EUC] = propagateUncertainty(hmg,HMG,@hmg2euc);

% the ellipse
[X,Y,Z] = cov3elli(euc, EUC, 3, 10) ;
set(MapFig.Lmk(Lmk.lmk).ellipse,...
    'xdata',   X,...
    'ydata',   Y,...
    'zdata',   Z,...
    'color',   color,...
    'visible', 'on');

% the mean:
set(MapFig.Lmk(Lmk.lmk).mean,...
    'xdata',   euc(1),...
    'ydata',   euc(2),...
    'zdata',   euc(3),...
    'color',   satColor(color),...
    'visible', 'on');

% the label
set(MapFig.Lmk(Lmk.lmk).label,...
    'position', euc + posOffset,...
    'string',   num2str(Lmk.id),...
    'visible',  'on');
