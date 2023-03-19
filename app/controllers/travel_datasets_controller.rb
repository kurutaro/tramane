class TravelDatasetsController < ApplicationController
  before_action :set_travel_dataset, only: %i[ show edit update destroy post_pdf ]

  # GET /travel_datasets or /travel_datasets.json
  def index
    @travel_datasets = TravelDataset.all
  end

  # GET /travel_datasets/1 or /travel_datasets/1.json
  def show
  end

  def post_pdf
    respond_to do |format|
      format.pdf do
        post_pdf = PracticePdf::PostPdf.new(@travel_dataset).render
        send_data post_pdf,
          filename: 'post_pdf.pdf',
          type: 'application/pdf',
          disposition: 'inline' # 外すとダウンロード
      end
    end
  end

  # GET /travel_datasets/new
  def new
    @travel_dataset = TravelDataset.new
    gon.stay_number = @travel_dataset.stay_number
  end

  # GET /travel_datasets/1/edit
  def edit
    gon.stay_number = @travel_dataset.stay_number
    gon.dataset = @travel_dataset.dataset
  end

  # POST /travel_datasets or /travel_datasets.json
  def create
    @travel_dataset = TravelDataset.new(travel_dataset_params)

    respond_to do |format|
      if @travel_dataset.save
        format.html { redirect_to travel_dataset_url(@travel_dataset), notice: "Travel dataset was successfully created." }
        format.json { render :show, status: :created, location: @travel_dataset }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @travel_dataset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /travel_datasets/1 or /travel_datasets/1.json
  def update
    respond_to do |format|
      if @travel_dataset.update(travel_dataset_params)
        format.html { redirect_to travel_dataset_url(@travel_dataset), notice: "Travel dataset was successfully updated." }
        format.json { render :show, status: :ok, location: @travel_dataset }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @travel_dataset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /travel_datasets/1 or /travel_datasets/1.json
  def destroy
    @travel_dataset.destroy

    respond_to do |format|
      format.html { redirect_to travel_datasets_url, notice: "Travel dataset was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_travel_dataset
      @travel_dataset = TravelDataset.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def travel_dataset_params
      params[:travel_dataset][:dataset] = Utils::TravelDatasetUtil.generate_dataset(params)
      params.require(:travel_dataset).permit(:name, :description, :start_date, :stay_number, :dataset)
    end
end
