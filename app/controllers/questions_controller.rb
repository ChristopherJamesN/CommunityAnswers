class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.where.not(user_id: current_user.id).paginate(:page => params[:page], :per_page => 5)
    render :answer
  end

  def your_questions
    @questions = Question.where(user_id: current_user.id).paginate(:page => params[:page], :per_page => 5)
    render :index
  end

  def home
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    if @question.user_id == current_user.id
      render :show
    else
      render :question_answer
    end
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)
    @question.no = 0
    @question.yes = 0
    @question.unsure = 0
    @question.yes12 = 0
    @question.yes26 = 0
    @question.yes45 = 0
    @question.yes63 = 0
    @question.yes80 = 0
    @question.yes_male = 0
    @question.yes_female = 0
    @question.yes_other = 0
    @question.no12 = 0
    @question.no26 = 0
    @question.no45 = 0
    @question.no63 = 0
    @question.no80 = 0
    @question.no_male = 0
    @question.no_female = 0
    @question.no_other = 0
    @question.unsure12 = 0
    @question.unsure26 = 0
    @question.unsure45 = 0
    @question.unsure63 = 0
    @question.unsure80 = 0
    @question.unsure_male = 0
    @question.unsure_female = 0
    @question.unsure_other = 0
    current_user.questions << @question

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    if params[:question]["Yes"]
      @question.update(yes: @question.yes + 1)
      current_user.questions << @question

      if current_user.age == 12
        @question.update(yes12: @question.yes12 + 1)
      elsif current_user.age == 26
        @question.update(yes26: @question.yes26 + 1)
      elsif current_user.age == 45
        @question.update(yes45: @question.yes45 + 1)
      elsif current_user.age == 63
        @question.update(yes63: @question.yes63 + 1)
      elsif current_user.age == 80
        @question.update(yes80: @question.yes80 + 1)
      end

      if current_user.sex == "Male"
        @question.update(yes_male: @question.yes_male + 1)
      elsif current_user.sex == "Female"
        @question.update(yes_female: @question.yes_female + 1)
      elsif current_user.sex == "Other"
        @question.update(yes_other: @question.yes_other + 1)
      end

      current_user.update(points: current_user.points += 1)
      respond_to do |format|
        format.html { redirect_to questions_path, notice: "Question was successfully answered. You have #{current_user.points} points!" }
        format.json { render :show, status: :ok, location: @question }
      end
    elsif params[:question]["No"]
      @question.update(no: @question.no + 1)
      current_user.questions << @question

      if current_user.age == 12
        @question.update(no12: @question.no12 + 1)
      elsif current_user.age == 26
        @question.update(no26: @question.no26 + 1)
      elsif current_user.age == 45
        @question.update(no45: @question.no45 + 1)
      elsif current_user.age == 63
        @question.update(no63: @question.no63 + 1)
      elsif current_user.age == 80
        @question.update(no80: @question.no80 + 1)
      end

      if current_user.sex == "Male"
        @question.update(no_male: @question.no_male + 1)
      elsif current_user.sex == "Female"
        @question.update(no_female: @question.no_female + 1)
      elsif current_user.sex == "Other"
        @question.update(no_other: @question.no_other + 1)
      end

      current_user.update(points: current_user.points += 1)
      respond_to do |format|
        format.html { redirect_to questions_path, notice: "Question was successfully answered. You have #{current_user.points} points!" }
        format.json { render :show, status: :ok, location: @question }
      end
    elsif params[:question]["Unsure"]
      @question.update(unsure: @question.unsure + 1)
      current_user.questions << @question

      if current_user.age == 12
        @question.update(unsure12: @question.unsure12 + 1)
      elsif current_user.age == 26
        @question.update(unsure26: @question.unsure26 + 1)
      elsif current_user.age == 45
        @question.update(unsure45: @question.unsure45 + 1)
      elsif current_user.age == 63
        @question.update(unsure63: @question.unsure63 + 1)
      elsif current_user.age == 80
        @question.update(unsure80: @question.unsure80 + 1)
      end

      if current_user.sex == "Male"
        @question.update(unsure_male: @question.unsure_male + 1)
      elsif current_user.sex == "Female"
        @question.update(unsure_female: @question.unsure_female + 1)
      elsif current_user.sex == "Other"
        @question.update(unsure_other: @question.unsure_other + 1)
      end

      current_user.update(points: current_user.points += 1)
      respond_to do |format|
        format.html { redirect_to questions_path, notice: "Question was successfully answered. You have #{current_user.points} points!" }
        format.json { render :show, status: :ok, location: @question }
      end
    else
      respond_to do |format|
        if @question.update(question_params)
          format.html { redirect_to @question, notice: 'Question was successfully updated.' }
          format.json { render :show, status: :ok, location: @question }
        else
          format.html { render :edit }
          format.json { render json: @question.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:content, :yes, :no, :unsure, :comments, :user_id, :image)
    end
end
