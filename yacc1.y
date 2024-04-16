%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct node {
    int type;
    int value;
    struct node *left;
    struct node *right;
} node;

void print_prefix(node *n);
%}

%union {
    int value;
    node *expression;
}

%token <value> NUMBER
%left '+' '-'
%left '*' '/'

%%

input: /* empty */
     | input line
     ;

line: expr '\n' {
        printf("Prefix expression: ");
        print_prefix($1);
        printf("\n");
        // Free memory used by the AST
        free($1);
     }
    ;

expr: NUMBER {
            $$ = (node *)malloc(sizeof(node));
            $$->type = NUMBER;
            $$->value = $1;
            $$->left = NULL;
            $$->right = NULL;
         }
    | '(' expr ')' %prec '-' {
            $$ = $2;
         }
    | expr '+' expr {
            $$ = (node *)malloc(sizeof(node));
            $$->type = '+';
            $$->left = $1;
            $$->right = $3;
         }
    | expr '-' expr {
            $$ = (node *)malloc(sizeof(node));
            $$->type = '-';
            $$->left = $1;
            $$->right = $3;
         }
    | expr '*' expr {
            $$ = (node *)malloc(sizeof(node));
            $$->type = '*';
            $$->left = $1;
            $$->right = $3;
         }
    | expr '/' expr {
            $$ = (node *)malloc(sizeof(node));
            $$->type = '/';
            $$->left = $1;
            $$->right = $3;
         }
    ;

%%

void print_prefix(node *n) {
    if (n == NULL) return;
    
    switch (n->type) {
        case NUMBER:
            printf("%d ", n->value);
            break;
        case '+':
        case '-':
        case '*':
        case '/':
            printf("%c ", n->type);
            print_prefix(n->left);
            print_prefix(n->right);
            break;
        default:
            printf("Invalid node type\n");
            break;
    }
}

int yyerror(const char *msg) {
    fprintf(stderr, "Error: %s\n", msg);
    return 1;
}
