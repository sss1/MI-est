sigmas = 0:0.1:50;
MIs = zeros(size(sigmas));

for sigma_i = 1:length(sigmas)

  sigma = sigmas(sigma_i);

  % generate data
  n = 1000;
  Xs = unifrnd(0, 1, n, 1);
  Ys = Xs + normrnd(0, sigma, n, 1);
  
  % compute MI estimate
  MIs(sigma_i) = MI_est(Xs, Ys);

end

plot(sigmas, MIs);
