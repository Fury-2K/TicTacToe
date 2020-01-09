# Pythono3 code to rename multiple  
# files in a directory or folder 
  
# importing os module 
import os 
  
# Function to rename multiple files 
def main(): 
    i = 0
      
    for filename in os.listdir("Emerald"): 
        currentNameArray = filename.split(".")
        dst = currentNameArray[0] + "_emerald." + currentNameArray[1]
        src ='Emerald/'+ filename 
        dst ='Emerald/'+ dst 
        
        # print(dst)
        
        # rename() function will 
        # rename all the files 
        os.rename(src, dst) 
        i += 1
  
# Driver Code 
if __name__ == '__main__': 
      
    # Calling main() function 
    main()