*&---------------------------------------------------------------------*
*& Report Z_USER_INPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z_USER_INPUT.

* REQUIREMENTS
* Write an ABAP code tha takes 3 user inputs
*     - Takes two numbers and one choice value
*     - Displays the result either in the LPS or as an Information message (Similar to ALERT in JavaScript)
* VALIDATIONS
* 1) All input fields should be mandatory.
* 2) Based on the choice value in the third input field, perform the required operation and display the result
*     - 1 - Adiition
*     - 2 - Difference
*     - 3 - Multiplication
*     - 4 - Division
* 3) Implement the logic using:
*     - IF-ENDIF and
*     - CASE-ENDCASE

PARAMETERS : p_num1 TYPE i DEFAULT 20 OBLIGATORY,
             p_num2 TYPE i DEFAULT 10 OBLIGATORY,
             p_choice type i DEFAULT 1 OBLIGATORY.
DATA v_res TYPE i.


* USING CASE-ENDCASE

*CASE p_choice.
*  WHEN 1.
*    v_res = p_num1 + p_num2.
*    MESSAGE |Sum of { p_num1 } and { p_num2 }  is { v_res }| type 'I'. "OR
*    WRITE :/ 'Sum of the two numbers is ', v_res.
*
*  WHEN 2.
*    v_res = p_num1 - p_num2.
*    MESSAGE |Difference of { p_num1 } and { p_num2 } is { v_res }| type 'I'.  "OR
*    WRITE :/ 'Difference of the two numbers is ', v_res.
*
*  WHEN 3.
*    v_res = p_num1 * p_num2.
*    MESSAGE |Product of { p_num1 } and { p_num2 } is { v_res }| type 'I'.   "OR
*    WRITE :/ 'Product of the two numbers is ', v_res.
*
*  WHEN 4.
*    v_res = p_num1 / p_num2.
*    MESSAGE |Division of { p_num1 } by { p_num2 } is { v_res }| type 'I'.   "OR
*    WRITE :/ 'Division of the two numbers is ', v_res.
*
*  WHEN OTHERS.
*    MESSAGE |Enter 1, 2, 3 or 4| type 'I'.     "OR
*    Write :/ 'Enter 1, 2, 3 or 4'.
*
*ENDCASE.


* USING IF-ENDIF

IF p_choice = 1.
  v_res = p_num1 + p_num2.
*  MESSAGE |Sum of { p_num1 } and { p_num2 }  is { v_res }| type 'I'.
  WRITE :/ 'Sum of the two numbers is ', v_res.

ELSEIF p_choice = 2.
  v_res = p_num1 - p_num2.

* This nested IF-ENDIF block is meant to correct the dsplaying of negative sign
* of negative numbers after the number [e.g 29- instead of -29] when using write statement for display
  IF v_res >= 0.
    MESSAGE |Difference of { p_num1 } and { p_num2 } is { v_res }| type 'I'.
    WRITE :/ 'Difference of the two numbers is ', v_res.
  ELSE.
    MESSAGE |Difference of { p_num1 } and { p_num2 } is { v_res }| type 'I'.
    WRITE :/ 'Difference of the two numbers is -'no-gap, v_res  NO-SIGN LEFT-JUSTIFIED. " Correcting the sign on this line
  ENDIF.

ELSEIF p_choice = 3.
  v_res = p_num1 * p_num2.
*  MESSAGE |Product of { p_num1 } and { p_num2 } is { v_res }| type 'I'.
  WRITE :/ 'Product of the two numbers is ', v_res.

ELSEIF p_choice = 4.
  v_res = p_num1 / p_num2.
*  MESSAGE |Division of { p_num1 } by { p_num2 } is { v_res }| type 'I'.
  WRITE :/ 'Division of the two numbers is ', v_res.

ELSE.
  MESSAGE |Enter 1, 2, 3 or 4| type 'I'.
  Write :/ 'Enter 1, 2, 3 or 4'.

ENDIF.
