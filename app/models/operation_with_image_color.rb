class OperationWithImageColor < ActiveRecord::Base
  require 'set'

    public do
    #PixelColorTypeHSV
    def pixel_color_type_hsv(h,s,v)
      color = h/20
      if v < 10
        color = 19
      elsif v > 75 && s < 12#//75 10
        color = 20
      elsif s < 20 && v < 72
        color = 21
      end
      color
    end
    def generate_points (t1,t2)
      set_of_points = Set.new
      min=-1;
      max = 1;
      (min..max).each do |i|
        t1_1 = t1;
        if t1 < 19
          t1_1 = t1+i;
          if t1_1<0
            t1_1=17;
          elsif t1_1 >17
            t1_1=0
          end
        end
        (min..max).each do |j|
          t2_2=t2;
          if t2 < 19
            t2_2 = t1+j;
            if t2_2<0
              t2_2=17;
            elsif t2_2 >17
              t2_2=0
            end
          end
          set_of_points.add([t1_1,t2_2]);
          set_of_points.add([t2_2,t1_1]);
        end
      end
      set_of_points
    end
     end

end
