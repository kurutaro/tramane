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
      # font 'app/assets/fonts/SourceHanSans-Bold.ttc'
      # text_box "旅行日程表", at: [0, 750], size: 15, align: :center
    end
  end
end