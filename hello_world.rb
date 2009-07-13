class Fixnum
  %w(x y).each do |m|
    define_method "norm_#{m}" do
      (self + 3 * Urf.__send__("max_#{m}")) % Urf.__send__("max_#{m}")
    end
  end
end

Urf = Class.new{
  attr_reader :feeld

  def initialize
    @feeld = %q(
      . . . . . . . . . x o
      . o . . x . . . . . .
      . . . . . x . . . . .
      . . . . . . x . . . .
      o . . . . . . . . . .
      . . . . . . . . . . .
      . . . . . . . . . . .
      . . . . . . . . . . .
      . . o o . . . . . o .
      . . . . . x . . . . .
      . . . . . . . . . . x
      . . . . o . . o . . .
      . . . . . . . . . . .
      . . . . . . x . . . .
      . . . . . . . . o . .
      . . . x . . . . . . x
      . . . . . . . . . . .
      . . . . . . . . . . .
      . . x . . . . . . . .
      . . . . . . o . x . .
      . . . . . . . . . . .
      . . . . x . . . . . .
      . . . . . x . . . . .
      . . . . . . . . . x .
    )[1..-2].gsub(/ /,'').split("\n")
  end

  def max_x; feeld.first.size; end
  def max_y; feeld.size; end

  def on(x, y)
    @feeld[y.norm_y][x.norm_x].chr
  end

  def getz_me(x, y)
    b4 = on(x, y)
    @feeld[y.norm_y][x.norm_x] = '.'
    b4
  end
}.new

class Ant
  attr_reader :x, :y, :belly

  def initialize
    @x, @y = rand(Urf.feeld.first.size), rand(Urf.feeld.size)
  end

  def self.queen
    return @queen if @queen
    @queen = new
    class << @queen
      def puke
        puts @belly.map { |shugary| (100 + shugary).chr rescue ' ' }.join
      end

      def getz_shugarz
        @belly = Array.new(11)
        Ant.lotz.map { |a| a.belly }.compact.each do |belly|
          belly.each { |xything| @belly[xything[0].norm_x] = xything[1].norm_y if xything[2] == 'o' }
        end
      end
    end
    @queen
  end

  def self.lotz
    @lotz ||= (1..99).map { new }.map { |it| 30.times { yield it }; it }
  end

  def haz_fownd_shugarz?
    Urf.on(x, y) != '.'
  end

  def wawkz
    @x, @y = @x + rand(3) - 1, @y + rand(3) - 1
  end

  def nom_nom
    (@belly ||= []) << [x, y, Urf.getz_me(x, y)]
  end

  self
end.lotz do |it|
  if it.wawkz && it.haz_fownd_shugarz?
    it.nom_nom
  end
end

Ant.queen.getz_shugarz
Ant.queen.puke