% Estimates the Shannon mutual information between two variables X and Y based
% on samples from their joint density. For simplicity, the estimator's
% parameters have been set internally, but these can be played with, as
% described below.
% 
% Inputs:
%     Xs - n-by-d_X data matrix of n samples of a d_X dimensional variable X
%     Ys - n-by-d_Y data matrix of n samples of a d_Y dimensional variable Y
% 
% Outputs:
%     I - estimated mutual information between X and Y

function I = MI_est(Xs, Ys)

  % SET ESTIMATOR PARAMETERS HERE
  % 'rot', 'hjsm', 'msp', 'lcv', 'hall', 'local', or d-by-1 numerical vector of
  % bandwidths for each dimension
  h = 'rot';
  % 'G', 'E', or 'L', for Gaussian, Epanechnikov/quadratic, or Laplacian kernel
  kernel = 'G';
  est_frac = 0.9; % fraction samples to be used for estimating the density



  [n, ~] = size(Xs);

  % split data into density estimation and functional evaluation portions
  dat = [Xs Ys];
  est_dat = dat(1:floor(n*est_frac), :);
  eval_dat = dat(floor(n*est_frac):end, :); 
  
  % compute joint and marginal KDEs
  p_XY = kde(est_dat', h, [], kernel);
  p_X = kde(est_dat(:, 1)', h, [], kernel);
  p_Y = kde(est_dat(:, 2)', h, [], kernel);
  
  % evaluate KDEs at each evaluation point
  evals_XY = evaluate(p_XY, eval_dat')';
  evals_X = evaluate(p_X, eval_dat(:, 1)')';
  evals_Y = evaluate(p_Y, eval_dat(:, 2)')';
  
  % compute MI estimate
  I = mean(evals_XY.*log(evals_XY./(evals_X.*evals_Y)));

end
