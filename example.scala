// trait Monad[A] {
//   def bind[B](f: A => Monad[B]): Monad[B]
//   // def unit[A](a: A): Monad[A]
// }

object Example {
  def fail[A](): Iterator[A] = Iterator()
  def singleton[A](a: A): Iterator[A] = Iterator(a)
  def disjunction[A](c1: Iterator[A], c2: Iterator[A]): Iterator[A] = c1 ++ c2
  def conjunction[A, B](c: Iterator[A], f: A => Iterator[B]): Iterator[B] = c.flatMap(f)

  def num(): Iterator[Int] = {
    disjunction(singleton(0), singleton(1))
  }

  def makePair(): Iterator[(Int, Int)] = {
    conjunction(
      num(),
      n1 => {
        conjunction(
          num(),
          n2 => singleton((n1, n2)))
      })
  }

  def main(args: Array[String]): Unit = {
    makePair().foreach(println)
  }
}

object Example2 {
  def num(): Iterator[Int] = Iterator(0, 1)

  def makePair(): Iterator[(Int, Int)] = {
    for {
      n1 <- num()
      n2 <- num()
    } yield (n1, n2)

    // num().flatMap(n1 =>
    //   num().flatMap(n2 =>
    //     singleton((n1, n2))))
  }

  def main(args: Array[String]): Unit = {
    makePair().foreach(println)
  }
}
