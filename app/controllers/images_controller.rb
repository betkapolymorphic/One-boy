

class ImagesController < ApplicationController

  def pixel_color_type_hsv(h,s,v)
    color = h / 20
    if v < 10
      color = 19
    elsif v > 75 && s < 12#//75 10
      color = 20
    elsif s < 20 && v < 72
      color = 21
    end
    color
  end
  def generate_points (t1,t2,min,max)
    set_of_points = Set.new

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
  def run_images(min,max,h1,s1,v1,h2,s2,v2)
    reload_inf(pixel_color_type_hsv(h1,s1,v1),
               pixel_color_type_hsv(h2,s2,v2),min,max);
  end



  def reload_inf(t1,t2,min,max)
    puts "RELOADEDS"
    @@count = 0
    @@images = []

    m= generate_points(t1,t2,min,max);
    m.each  do |x|
      puts ["point = ",x[0],x[1]].join(' ')
    end


    m.each  do |x|
    a = Image.where(["colortype=",x[0].to_s,
                           "AND","colortype1=",x[1].to_s].join(' ')).all
      a.each do |i|
        @@images.push (i)
      end
    end
    @@images = @@images.shuffle
    @@size = @@images.size
  end
  def show

    if(params[:s1].present?)
        run_images(params[:min].to_i,params[:max].to_i,params[:h1].to_i,params[:s1].to_i,
        params[:v1].to_i,params[:h2].to_i,params[:s2].to_i,params[:v2].to_i);
    end
    @count = @@count;
    @size = @@size;
    @image = @@images[@@count];
    @image = Image.new(:url =>'https://pp.vk.me/c322219/v322219596/20a8/MX_0_lCKbvc.jpg')
  end

  def nextPicture
    @@count+=1;
    render text: "next";
  end
  def prevPicture
    @@count+=-1;
    render text: "prev";
  end

  private
  def image_params
    params.require(:image).permit(:colortype)
  end

end
