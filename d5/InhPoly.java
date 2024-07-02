
//Program to show inheritance and polymorphism
import java.util.*;

class Circle {
    double radius = 1.0;
    String color = "red";

    Circle() {

    }

    Circle(double radius) {
        this.radius = radius;

    }

    Circle(double radius, String color) {
        this.radius = radius;
        this.color = color;
    }

    public double getRadius() {
        return this.radius;
    }

    public void setRadius(double radius) {
        this.radius = radius;

    }

    public String getColor() {
        return color;

    }

    public void setColor(String color) {
        this.color = color;
    }

    public double getArea() {
        return (Math.PI * radius * radius);
    }

    public String toString() {
        return "Circle[radius=" + radius + ", color=" + color + "]";
    }
}

class Cylinder extends Circle {
    double height = 1.0;

    Cylinder() {

    }

    Cylinder(double radius) {
        super.radius = radius;// inheriting radius of parent class method
    }

    Cylinder(double radius, double height) {
        super.radius = radius;
        this.height = height;

    }

    Cylinder(double radius, double height, String color) {
        super.radius = radius;
        this.height = height;
        super.color = color;

    }

    public double getHeight() {
        return height;
    }

    public void setHeight(double height) {
        this.height = height;
    }

    public double getVolume() {
        return (Math.PI) * radius * radius * height;
    }

    @Override
    public String toString() {
        return "Cylinder[radius=" + radius + ",height=" + height + ",color=" + color + "]";
    }
}

public class InhPoly {
    public static void main(String[] args) {
        Circle[] circles = { new Cylinder(12.34), new Cylinder(12.34, 10.0), new Cylinder(12.34, 10.0, "blue") };
        for (Circle circle : circles) {
            System.out.println(circle.toString());
            if (circle instanceof Cylinder) {
                // if circle is an instance of Cylinder
                Cylinder cylinder = (Cylinder) circle;
                System.out.println("Volume: " + cylinder.getVolume());

            }

        }
    }
}
