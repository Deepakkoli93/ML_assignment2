function rand_init = init_weights(input_layer_size, output_layer_size)
rand_init = zeros(output_layer_size, 1 + input_layer_size);



temp = rand(output_layer_size, 1+input_layer_size);
rand_init = temp*2*0.125-0.125;








end
