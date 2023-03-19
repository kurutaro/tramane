module PracticePdf
  class PostPdf < Prawn::Document
    def initialize(record)
      # 新規PDF作成
      super(
        page_size: 'A4',
        top_margin: 40,
        bottom_margin: 40,
        left_margin: 40,
        right_margin: 40
      ) 

      stroke_axis # 座標を表示
      contents(record)
    end

    def contents(record)
      @record = record
      font 'app/assets/fonts/SourceHanSans-Bold.ttf'
      text_box "旅行日程表", at: [0, 750], size: 15, align: :center

      data = [
        ["John Doe", "25", ["Email: john@example.com", "Phone: 123-456-7890"]],
        ["John Doe", "25", ["Email: john@example.com", "Phone: 123-456-7890"]],
        ["Jane Smith", "30", ["Email: jane@example.com", "Phone: 098-765-4321"]],
      ]
      
      table data do |t|
        t.column(0).width = 100
        t.column(1).width = 50
        t.column(2).width = 150
        
        # セルを結合してサブカラムを作成
        t.cells[1,2] = make_table([["Email: john@example.com"], ["Phone: 123-456-7890"]])
        t.cells[2,2] = make_table([["Email: jane@example.com"], ["Phone: 098-765-4321"]])
      end

    #   # 枠線を引く
    #   stroke_color "ffffff"
    #   stroke_rectangle [0, 730], 80, 20
    #   stroke_rectangle [0, 710], 80, 20
    #   stroke_color "666666"
    #   stroke_rectangle [80, 730], 430, 20
    #   stroke_rectangle [80, 710], 430, 20

    #   # 枠線の内部を塗りつぶす
    #   fill_color "666666"
    #   fill_and_stroke_rectangle [0, 730], 80, 20
    #   fill_and_stroke_rectangle [0, 710], 80, 20

    #   # テキストを中央揃えで書き込む
    #   fill_color "ffffff"
    #   text_box "行き先", :at => [0, 730], :width => 80, :height => 20, :overflow => :shrink_to_fit, :align => :center, :valign => :center
    #   text_box "期間", :at => [0, 710], :width => 80, :height => 20, :overflow => :shrink_to_fit, :align => :center, :valign => :center
    end
  end
end