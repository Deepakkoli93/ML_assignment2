function a = siggrad(x)
z=sigmoid(x);
a=z.*(1-z);
