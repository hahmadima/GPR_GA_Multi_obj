if nvars==2

figure (2)
subplot(331); scatter(Optimal_outputs(:,1),Optimal_outputs(:,2),'Ok');xlabel('y1');ylabel('y2');
title(['Pareto front of multiple fitness functions using GA' ]);grid on;
subplot(332); scatter(out1,out2); title(['Real data plot' ]);grid on; xlabel('y1');ylabel('y2');
subplot(333); scatter(ypred1,ypred2); title(['Modeled data plot' ]);grid on; xlabel('y1');ylabel('y2');

subplot(334); scatter(Optimal_inputs(:,1),Optimal_outputs(:,1)); title(['x1 vs ypred1' ]);grid on; xlabel('x1');ylabel('y1');
subplot(335); scatter(Optimal_inputs(:,2),Optimal_outputs(:,1)); title(['x1 vs ypred1' ]);grid on; xlabel('x2');ylabel('y1');
subplot(337); scatter(Optimal_inputs(:,1),Optimal_outputs(:,2)); title(['x2 vs ypred2' ]);grid on; xlabel('x1');ylabel('y2');
subplot(338); scatter(Optimal_inputs(:,2),Optimal_outputs(:,2)); title(['x3 vs ypred2' ]);grid on; xlabel('x2');ylabel('y2');


elseif nvars==3
figure (2)
subplot(331); scatter(Optimal_outputs(:,1),Optimal_outputs(:,2),'Ok');xlabel('ADG, g');ylabel('G:F, g/g');
title(['Pareto front of multiple fitness functions using GA' ]);grid on;
subplot(332); scatter(out1,out2); title(['Real data plot' ]);grid on; xlabel('ADG, g');ylabel('G:F, g/g');
subplot(333); scatter(ypred1,ypred2); title(['Modeled data plot' ]);grid on; xlabel('ADG, g');ylabel('G:F, g/g');

subplot(334); scatter(Optimal_inputs(:,1),Optimal_outputs(:,1)); title(['x1 vs ypred1' ]);grid on; xlabel('x1');ylabel('y1');
subplot(335); scatter(Optimal_inputs(:,2),Optimal_outputs(:,1)); title(['x1 vs ypred1' ]);grid on; xlabel('x2');ylabel('y1');
subplot(336); scatter(Optimal_inputs(:,3),Optimal_outputs(:,1)); title(['x2 vs ypred1' ]);grid on; xlabel('x3');ylabel('y1');
subplot(337); scatter(Optimal_inputs(:,1),Optimal_outputs(:,2)); title(['x2 vs ypred2' ]);grid on; xlabel('x1');ylabel('y2');
subplot(338); scatter(Optimal_inputs(:,2),Optimal_outputs(:,2)); title(['x3 vs ypred2' ]);grid on; xlabel('x2');ylabel('y2');
subplot(339); scatter(Optimal_inputs(:,3),Optimal_outputs(:,2)); title(['x3 vs ypred2' ]);grid on; xlabel('x3');ylabel('y2');

elseif navars==4
figure (2)
subplot(331); scatter(Optimal_outputs(:,1),Optimal_outputs(:,2),'Ok');xlabel('ADG, g');ylabel('G:F, g/g');
title(['Pareto front of multiple fitness functions using GA' ]);grid on;
subplot(332); scatter(out1,out2); title(['Real data plot' ]);grid on; xlabel('ADG, g');ylabel('G:F, g/g');
subplot(333); scatter(ypred1,ypred2); title(['Modeled data plot' ]);grid on; xlabel('ADG, g');ylabel('G:F, g/g');

subplot(334); scatter(Optimal_inputs(:,1),Optimal_outputs(:,1)); title(['x1 vs ypred1' ]);grid on; xlabel('x1');ylabel('y1');
subplot(335); scatter(Optimal_inputs(:,2),Optimal_outputs(:,1)); title(['x1 vs ypred1' ]);grid on; xlabel('x2');ylabel('y1');
subplot(336); scatter(Optimal_inputs(:,3),Optimal_outputs(:,1)); title(['x2 vs ypred1' ]);grid on; xlabel('x3');ylabel('y1');
subplot(337); scatter(Optimal_inputs(:,1),Optimal_outputs(:,2)); title(['x2 vs ypred2' ]);grid on; xlabel('x1');ylabel('y2');
subplot(338); scatter(Optimal_inputs(:,2),Optimal_outputs(:,2)); title(['x3 vs ypred2' ]);grid on; xlabel('x2');ylabel('y2');
subplot(339); scatter(Optimal_inputs(:,3),Optimal_outputs(:,2)); title(['x3 vs ypred2' ]);grid on; xlabel('x3');ylabel('y2');

end