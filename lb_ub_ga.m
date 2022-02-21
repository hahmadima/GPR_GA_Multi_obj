if nvars==1;
    zlb=[min(inp(:,1))];
    zub=[max(inp(:,1))];

elseif nvars==2;
    zlb=[min(inp(:,1)) min(inp(:,2))];
    zub=[max(inp(:,1)) max(inp(:,2))];

elseif nvars==3;
    zlb=[min(inp(:,1)) min(inp(:,2)) min(inp(:,3)) ];
    zub=[max(inp(:,1)) max(inp(:,2)) max(inp(:,3)) ];


elseif nvars==4;
    zlb=[min(inp(:,1)) min(inp(:,2)) min(inp(:,3))  min(inp(:,4))];
    zub=[max(inp(:,1)) max(inp(:,2)) max(inp(:,3))  max(inp(:,4))];

elseif nvars==5;
    zlb=[min(inp(:,1)) min(inp(:,2)) min(inp(:,3))  min(inp(:,4)) min(inp(:,5))];
    zub=[max(inp(:,1)) max(inp(:,2)) max(inp(:,3))  max(inp(:,4)) max(inp(:,5))];

elseif nvars==6;
    zlb=[min(inp(:,1)) min(inp(:,2)) min(inp(:,3))  min(inp(:,4)) min(inp(:,5)) min(inp(:,6))];
    zub=[max(inp(:,1)) max(inp(:,2)) max(inp(:,3))  max(inp(:,4)) max(inp(:,5)) max(inp(:,6))];


elseif nvars==7;
    zlb=[min(inp(:,1)) min(inp(:,2)) min(inp(:,3))  min(inp(:,4)) min(inp(:,5)) min(inp(:,6)) min(inp(:,7))];
    zub=[max(inp(:,1)) max(inp(:,2)) max(inp(:,3))  max(inp(:,4)) max(inp(:,5)) max(inp(:,6)) max(inp(:,7))];

elseif nvars==8;
    zlb=[min(inp(:,1)) min(inp(:,2)) min(inp(:,3))  min(inp(:,4)) min(inp(:,5)) min(inp(:,6)) min(inp(:,7)) min(inp(:,8))];
    zub=[max(inp(:,1)) max(inp(:,2)) max(inp(:,3))  max(inp(:,4)) max(inp(:,5)) max(inp(:,6)) max(inp(:,7)) max(inp(:,8))];

elseif nvars==9;
    zlb=[min(inp(:,1)) min(inp(:,2)) min(inp(:,3))  min(inp(:,4)) min(inp(:,5)) min(inp(:,6)) min(inp(:,7)) min(inp(:,8)) min(inp(:,9))];
    zub=[max(inp(:,1)) max(inp(:,2)) max(inp(:,3))  max(inp(:,4)) max(inp(:,5)) max(inp(:,6)) max(inp(:,7)) max(inp(:,8)) max(inp(:,9))];

end