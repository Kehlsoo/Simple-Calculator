#import <Foundation/Foundation.h>

//creating calculator object
@interface Calculator : NSObject {
    double tally;
    double num;
    
}

    -(double) multiply: (double) input; //multiplication method
    -(double) divide: (double) input; //division method
    -(double) add: (double) input; //addition method
    -(double) subtract: (double) input; //subtraction method
    
@end

//implementing various calculator methods
@implementation Calculator

//multiplication operation
-(double) multiply: (double) input {
    tally *= input;
    return tally;
}

//division operation
-(double) divide: (double) input {
    if (input == 0){
        printf("You can't divide by 0");
        return 0.0;
        }
    else{
        tally /= input;
        return tally;
        }

}

//addition operation
-(double) add: (double) input {
    tally += input;
    return tally;
}

//subtraction operation
-(double) subtract: (double) input {
    tally -= input;
    return tally;
}
@end

//main method
void main(int argc, const char * argv[]) { 
        
        double num = 0; //number user specifies
        double tally = 1; //total
        char op; //user specified operation
        char buf[256]; //buffer to hold user specifications
        
        Calculator *Calc = [[Calculator alloc] init]; //our calculator object
        
        printf("\nEnter calculations using form: operation number\n");
        printf("Example: +2\n\n");
        
        printf("Enter a space to exit\n\n");

        while (1) {
            printf("\nEnter calulation. . . \n");
            fgets(buf,256,stdin); //getting user input
            op = buf[0];
            num = atoi(&buf[1]);
            
            printf("You entered number: %lf ", num);
            printf("with operation: %c\n", op);

            switch (op) {
            
                case '*': //if op is multiplication
                    tally = [Calc multiply: num];
                    printf("Answer is now: %lf\n", tally);
                    break;
                    
                case '/': //if op is division
                    tally = [Calc divide: num];
                    printf("Answer is now: %lf\n\n", tally);
                    break;
                    
                case '+': //if op is addition
                    tally = [Calc add: num];
                    printf("Answer is now: %lf\n", tally);
                    break;
                    
                case '-': //if op is subtraction
                    tally = [Calc subtract: num];
                    printf("Answer is now: %lf\n", tally);
                    break;
                    
                case '^': //if op is exponent
                    for (int i = 1; i <= num; i++){
                        tally = [Calc multiply: tally];
                    }
                    printf("Answer is now: %lf\n\n", tally);
                    break;

                default:
                    break;
            }

           }

}