False Position 
This is a root finding method that uses an approximation method of finding the root of an input function. 
Inputs:
func - The function to be approximated
   x_l - The lower guess
   x_u - The upper guess
   es - Relative error (the default error is set to 0.0001%)
   maxiter - Numeber of iterations (the default is set to 200)
Outputs:
   root - Apprximated root location on function
   fx - Function value at location of root
   ea - Approximate relative error in %
   iter - Number of iterations performed

