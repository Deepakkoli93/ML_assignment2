function a = visualize(arr,index)

colormap(gray);
image_mat = reshape(arr(index, :), 28, 28);
%a = image_mat;
imagesc(transpose(image_mat));
