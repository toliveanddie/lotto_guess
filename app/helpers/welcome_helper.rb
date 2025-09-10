module WelcomeHelper


  ################ treasure hunt #####################
  def treasure_hunt
    results = []

    years = ['https://www.lottery.net/pennsylvania/treasure-hunt/numbers/2025',
             'https://www.lottery.net/pennsylvania/treasure-hunt/numbers/2024']

    years.each do |year|
      doc = Nokogiri::HTML(URI.open(year))
      doc.css('.ball').each do |data|
        data = data.content.strip
        results.push(data)
      end
    end

    draws = []
    results.each_slice(5){|slice| draws.push(slice)}

    chold = []
    dhold = []
    1.times do |j|
      draws[j].each do |number|
        c=0
        count = 0
        draws.length.times do |i|
          c+=1
          if draws[i+j+1].include?(number)
            dhold.push(draws[i])
            count+=1
            if count == 2
              break
            end
          end
        end
        chold.push(c)
      end
    end

    counts = Hash.new(0)
    order = draws.flatten.uniq.reverse
    order.each do |number|
      counts[number] = 0
    end

    dhold.each do |draw|
      draw.each do |number|
        counts[number] += 1
      end
    end

    targets = [ 1, 7, 15, 23, 30 ]
    sorted = counts.sort_by{|k,v| v}.to_h
    (5..30).each do |c|
      picks = []
      remaining = sorted.keys.first(c).map(&:to_i)
      targets.each do |target|
        picks.push(remaining.min_by{|num| (num - target).abs})
      end
      if picks.uniq.size >= 5
        return picks
        break
      end
    end

  end # treasure hunt

###################### cash 5 ######################

  def cash5

    results = []
    years = ['https://www.lottery.net/pennsylvania/cash-5/numbers/2025',
             'https://www.lottery.net/pennsylvania/cash-5/numbers/2024']

    years.each do |year|
      doc = Nokogiri::HTML(URI.open(year))
      doc.css('.ball').each do |data|
        data = data.content.strip
        results.push(data)
      end
    end

    draws = []
    results.each_slice(5){|slice| draws.push(slice)}

    chold = []
    dhold = []
    1.times do |j|
      draws[j].each do |number|
        c=0
        count = 0
        draws.length.times do |i|
          c+=1
          if draws[i+j+1].include?(number)
            dhold.push(draws[i])
            count+=1
            if count == 3
              break
            end
          end
        end
        chold.push(c)
      end
    end

    counts = Hash.new(0)
    order = draws.flatten.uniq.reverse
    order.each do |number|
      counts[number] = 0
    end

    dhold.each do |draw|
      draw.each do |number|
        counts[number] += 1
      end
    end

    targets = [1,11,22,33,43]
    sorted = counts.sort_by{|k,v| v}.to_h
    (5..43).each do |c|
      picks = []
      remaining = sorted.keys.first(c).map(&:to_i)
      targets.each do |target|
        picks.push(remaining.min_by{|num| (num - target).abs})
      end
      if picks.uniq.size >= 5
        return picks
        break
      end
    end

  end # Cash 5

###################### match6 ##########################

  def match6
    results = []
    years = ['https://www.lottery.net/pennsylvania/match-6-lotto/numbers/2025',
             'https://www.lottery.net/pennsylvania/match-6-lotto/numbers/2024']

    years.each do |year|
      doc = Nokogiri::HTML(URI.open(year))
      doc.css('.ball').each do |data|
        data = data.content.strip
        results.push(data)
      end
    end

    draws = []
    results.each_slice(6){|slice| draws.push(slice)}

    chold = []
    dhold = []
    1.times do |j|
      draws[j].each do |number|
        c=0
        count = 0
        draws.length.times do |i|
          c+=1
          if draws[i+j+1].include?(number)
            dhold.push(draws[i])
            count+=1
            if count == 2
              break
            end
          end
        end
        chold.push(c)
      end
    end

    counts = Hash.new(0)
    order = draws.flatten.uniq.reverse
    order.each do |number|
      counts[number] = 0
    end

    dhold.each do |draw|
      draw.each do |number|
        counts[number] += 1
      end
    end

    targets = [1,10,20,30,40,49]
    sorted = counts.sort_by{|k,v| v}.to_h
    (6..49).each do |c|
      picks = []
      remaining = sorted.keys.first(c).map(&:to_i)
      targets.each do |target|
        picks.push(remaining.min_by{|num| (num - target).abs})
      end
      if picks.uniq.size >= 6
        return picks
        break
      end
    end
  end # match6

###########################  cash for life ##############################

  def cashforlife
    results = []
    bonus = []
    years = ['https://www.lottery.net/cash-4-life/numbers/2025',
             'https://www.lottery.net/cash-4-life/numbers/2024']

    years.each do |year|
      doc = Nokogiri::HTML(URI.open(year))
      doc.css('.ball').each do |data|
        data = data.content.strip
        results.push(data)
      end
      doc.css('.cash-ball').each do |data|
        data = data.text.strip
        bonus.push(data)
      end
    end

    draws = []
    results.each_slice(5){|slice| draws.push(slice)}

    chold = []
    dhold = []
    1.times do |j|
      draws[j].each do |number|
        c=0
        count = 0
        draws.length.times do |i|
          c+=1
          if draws[i+j+1].include?(number)
            dhold.push(draws[i])
            count+=1
            if count == 4
              break
            end
          end
        end
        chold.push(c)
      end
    end

    counts = Hash.new(0)
    order = draws.flatten.uniq.reverse
    order.each do |number|
      counts[number] = 0
    end

    dhold.each do |draw|
      draw.each do |number|
        counts[number] += 1
      end
    end

    targets = [1,15,30,45,60]
    sorted = counts.sort_by{|k,v| v}.to_h
    (5..60).each do |c|
      picks = []
      remaining = sorted.keys.first(c).map(&:to_i)
      targets.each do |target|
        picks.push(remaining.min_by{|num| (num - target).abs})
      end
      if picks.uniq.size >= 5
        hold = []
        hold.push(picks)
        hold.push(bonus.uniq.last)
        return hold
        break
      end
    end
  end # cash 4 life

  ######################## powerball ############################
  def powerball
    results = []
    bonus = []

    years = ['https://www.lottery.net/powerball/numbers/2025',
            'https://www.lottery.net/powerball/numbers/2024']

    years.each do |year|
      doc = Nokogiri::HTML(URI.open(year))
      doc.css('.ball').each do |data|
        d = data.text.strip
        results.push(d) if d.match?(/^\d+$/)
      end
      doc.css('.powerball').each do |data|
        d = data.text.strip
        bonus.push(d) if d.match?(/^\d+$/)
      end
    end

    draws = []
    results.each_slice(5){|slice| draws.push(slice)}

    targets = [1,17,35,52,69]
    numbers = draws.flatten.uniq
    remaining = (numbers - draws.first(14).flatten.uniq).map(&:to_i)
    picks = []
    targets.each do |target|
      picks.push(remaining.min_by{|e| (e-target).abs})
    end
    hold = []
    hold.push(picks)
    bnumbers = ('1'..'26').to_a
    hold.push((bnumbers - bonus.first(26).uniq).first)
    return hold

  end # powerball

  ################################ megamillions ############################\

  def megamillions
    results = []
    bonus = []
    years = ['https://www.lottery.net/mega-millions/numbers/2025',
             'https://www.lottery.net/mega-millions/numbers/2024',
             'https://www.lottery.net/mega-millions/numbers/2023']

    years.each do |year|
      doc = Nokogiri::HTML(URI.open(year))
      doc.css('.ball').each do |data|
        data = data.content.strip
        results.push(data)
      end
      doc.css('.mega-ball').each do |data|
        data = data.text.strip
        bonus.push(data)
      end
    end

    draws = []
    results.each_slice(5){|slice| draws.push(slice)}

    chold = []
    dhold = []
    1.times do |j|
      draws[j].each do |number|
        c=0
        count = 0
        draws.length.times do |i|
          c+=1
          if draws[i+j+1].include?(number)
            dhold.push(draws[i])
            count+=1
            if count == 4
              break
            end
          end
        end
        chold.push(c)
      end
    end

    counts = Hash.new(0)
    order = draws.flatten.uniq.reverse
    order.each do |number|
      counts[number] = 0
    end

    dhold.each do |draw|
      draw.each do |number|
        counts[number] += 1
      end
    end

    targets = [1,18,35,52,70]
    sorted = counts.sort_by{|k,v| v}.to_h
    (5..70).each do |c|
      picks = []
      remaining = sorted.keys.first(c).map(&:to_i)
      targets.each do |target|
        picks.push(remaining.min_by{|num| (num - target).abs})
      end
      if picks.uniq.size >= 5
        hold = []
        hold.push(picks)
        bnumbers = ('1'..'24').to_a
        hold.push((bnumbers - bonus.first(24).uniq).first)
        return hold
        break
      end
    end
  end # megamillions


end
