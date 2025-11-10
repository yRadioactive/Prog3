/* Codevorlage zum 7. Foliensatz
   Alternative Programmierparadigmen 2025
   Prof. Baltasar Trancón Widemann */

import java.lang.Math;

abstract class Expr {

  public abstract int eval();

  @Override
  public abstract String toString();

  protected String toStringNeg() {
    return "(" + toString() + ")";
  }

  public abstract boolean hasZero();

  public abstract int noNegConstants();

}

class Constant extends Expr {

  private final int value;

  public Constant(int value) {
    this.value = value;
  }

  @Override
  public int eval() {
    return value;
  }

  @Override
  public String toString() {
    return String.valueOf(value);
  }

  @Override
  protected String toStringNeg() {
    return toString();
  }

  @Override
  public boolean hasZero() {
    return value == 0;
  }

  @Override
  public int noNegConstants() {

    return Math.abs(value);
  }

}

class Neg extends Expr {

  private final Expr operand;

  public Neg(Expr operand) {
    this.operand = operand;
  }

  @Override
  public int eval() {
    return -operand.eval();
  }

  @Override
  public String toString() {
    return "- " + operand.toStringNeg();
  }

  @Override
  public boolean hasZero() {
    return operand.hasZero();
  }

  @Override
  public int noNegConstants() {
    return Math.abs(operand.eval());
  }

}

class Add extends Expr {

  private final Expr operand1;
  private final Expr operand2;

  public Add(Expr operand1, Expr operand2) {
    this.operand1 = operand1;
    this.operand2 = operand2;
  }

  @Override
  public int eval() {
    return operand1.eval() + operand2.eval();
  }

  @Override
  public String toString() {
    final String plus = operand2 instanceof Neg ? " " : " + ";
    return operand1.toString() + plus + operand2.toString();
  }

  @Override
  public boolean hasZero() {
    return operand1.hasZero() || operand2.hasZero();
  }

  @Override
  public int noNegConstants() {
    return Math.abs(operand1.eval()+operand2.eval());
  }

  class Mult extends Expr{
    
    private final Expr operand1;
    private final Expr operand2;

    public Mult(Expr operand1, Expr operand2){
      this.operand1=operand1;
      this.operand2=operand2;
    }

    @Override
    public int eval() {
      return operand1.eval()*operand2.eval();
    }

    @Override
    public String toString() {
      return operand1.eval()*operand2.eval() + " : "+operand1.eval()+"*"+operand2.eval();
    }

    @Override
    public boolean hasZero() {
      return operand1.hasZero() || operand2.hasZero();
    }

    @Override
    public int noNegConstants() {
      return Math.abs(operand1.eval()*operand2.eval());
    }



  }

}