function u = denoise(f, lambda)

[height, width] = size(f);
f_vector = reshape(f, 1, width* height);

grad = discrete_gradient(width, height);
laplace = -grad' * grad;

system_matrix = lambda * speye(width * height) - laplace;

u_vector = system_matrix\(lambda * f_vector');

u = reshape(u_vector, height, width);
