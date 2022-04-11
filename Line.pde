class Line {
  
  PVector a; // координаты первой точки линии
  PVector b; // координаты второй точки линии
  
  Line(PVector start, PVector end) {
    a = start.copy();
    b = end.copy();
  }
  
  void display() { // выводит на экран линию с координатами, загруженными в экземпляр данного класса 
     stroke(255); // устанавливаем цвет линии
     line(a.x, a.y, b.x, b.y); // рисуем линию
  }
  
  PVector start() { // функция возвращает координаты начальной точки
    return a.copy(); 
  }

  PVector end() { // функция возвращает координаты конечной точки
    return b.copy();
  }
  
  PVector left() { // функция возвращает координаты вектора длины |AB|/3 с начальной точкой в A
    PVector v = PVector.sub(b, a);
    v.div(3);
    v.add(a);
    return v;
  }
  
  PVector mid() { // функция возвращает координаты вектора длины |AB|/3 повернутого на 60 градусов 
    PVector v = PVector.sub(b, a);
    v.div(3);
    PVector p = a.copy();
    p.add(v);
    v.rotate(-radians(60));
    p.add(v);
    return p;
  }
  
  PVector right() { // функция возвращает координаты вектора длины |BA|/3 с начальной точкой в B
    PVector v = PVector.sub(a, b);
    v.div(3);
    v.add(b);
    return v;
  }
    
}
