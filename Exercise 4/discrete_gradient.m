function grad = discrete_gradient(width, height)

n_pixels = width * height;

e = ones(n_pixels, 1);
grad_x = spdiags([-e e], [0 height], n_pixels, n_pixels);
grad_y = spdiags([-e e], 0:1, n_pixels, n_pixels);

grad = [grad_x; grad_y];
