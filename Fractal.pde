class Fractal {
  
  PVector start; // координаты левой точки начального треугольника 
  PVector end; // координаты правой точки начального треугольника
  PVector eng; // координаты верхней точки начального треугольника
  ArrayList<Line> lines; // список линий для дробления
  int count; // число итераций 
  
  Fractal() {
    start = new PVector(width / 4, ((height - 20)/ 2) + 100); // расчитываем начальные координаты
    end = new PVector(width / 1.5, ((height - 20)/ 2) + 100);
    eng = start.copy();
    PVector v = PVector.sub(end, start);
    v.rotate(radians(-60));
    eng.add(v);
    lines = new ArrayList<Line>();
    restart();
  }
  
  void restart() {
    count = 0; // обнуляем колличество итераций 
    lines.clear(); // удаляем данные из списка линий
    lines.add(new Line(end, start)); // втавляем начальные линии в список
    lines.add(new Line(start, eng));
    lines.add(new Line(eng, end));
    
  }
  
  int getCount() { // данная функция возвращает колличество итерараций на данный момент 
    return count;
  }
  
  void render() { // данная функция выводит на экран линии из списка
    for(Line l : lines) {
      l.display();
    }
  }
  
  ArrayList iterate(ArrayList<Line> before) { // данная функция дробит линии из списка 
    ArrayList now = new ArrayList<Line>();
    for(Line l : before) { // делим линии из списка на четыре части
      PVector a = l.start();
      PVector b = l.left();
      PVector c = l.mid();
      PVector d = l.right();
      PVector e = l.end();
      now.add(new Line(a,b)); // разделенная на 3 начальная линия, находящаяся слева
      now.add(new Line(b,c)); // разделенная на 3 начальная линия повернуная на - 60 градусов
      now.add(new Line(c,d)); // разделенная на 3 начальная линия повернуная на 60 градусов
      now.add(new Line(d,e)); // разделенная на 3 начальная линия, находящаяся справа
    }
    return now;
  }
  
  void next() {
    lines = iterate(lines);
    count++;
  }
}
