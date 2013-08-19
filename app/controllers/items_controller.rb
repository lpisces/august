require 'digest/md5'  
require 'net/http'  
require 'uri'

class ItemsController < CpanelController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        @item.images.delete_all
        unless params.require(:item)[:images_id].nil?
          params.require(:item)[:images_id].each do |id|
            image = Image.find_by_id(id)
            (@item.images << image) unless image.nil?
          end
        end
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @item }
      else
        format.html { render action: 'new' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        @item.images.delete_all
        unless params.require(:item)[:images_id].nil?
          params.require(:item)[:images_id].each do |id|
            image = Image.find_by_id(id)
            (@item.images << image) unless image.nil?
          end
        end
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :no_content }
    end
  end

  def get_info
    num_iid = params[:num_iid]
    app_key = Setting.find_by_name('tbk_appkey').try(:value)
    app_secret = Setting.find_by_name('tbk_secret').try(:value)
    params = taobao_item_params app_key, app_secret, num_iid
    json = http_get(url(params))
    render :json => ActiveSupport::JSON.decode(json)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit!
    end

    def sign(app_secret, params) 
      str = []
      str << app_secret
      str << params.sort.join 
      str << app_secret
      Digest::MD5.hexdigest(str.join).upcase
    end
  
    def api_url
      api_url = 'http://gw.api.taobao.com/router/rest'
    end
  
    def url(params)
      url = []
      params.sort.each {|k, v| url << (k.to_s << '=' << URI.encode(v.to_s).to_s)}
      api_url << '?' << (url.join '&')
    end
  
    def http_get(url)
      res = Net::HTTP.get_response(URI.parse(url))
      res.body 
    end

    def img_params(app_key, app_secret, num_iid)
      params = {}
      params[:format] = 'json'
      params[:timestamp] = (Time.now).strftime("%Y-%m-%d %H:%M:%S")
      params[:sign_method] = 'md5'
      params[:v] = '2.0'
      params[:method] = 'taobao.items.list.get'
      params[:fields] = ['item_img.url'].join ','
      params[:num_iids] = num_iid
      params[:app_key] = app_key
      params[:sign] = sign(app_secret, params)
      params
    end
  
    def taobao_item_params(app_key, app_secret, num_iid)
      params = {}
      params[:format] = 'json'
      params[:timestamp] = (Time.now).strftime("%Y-%m-%d %H:%M:%S")
      params[:sign_method] = 'md5'
      params[:v] = '2.0'
      params[:method] = 'taobao.item.get'
      params[:num_iid] = num_iid
      params[:fields] = ['detail_url','num_iid','title','nick','type','cid','seller_cids','props','input_pids','input_str','desc','pic_url','num','valid_thru','list_time','delist_time','stuff_status','location','price','post_fee','express_fee','ems_fee','has_discount','freight_payer','has_invoice','has_warranty','has_showcase','modified','increment','approve_status','postage_id','product_id','auction_point','property_alias','item_img','prop_img','sku','video','outer_id','is_virtual'].join ','
      params[:app_key] = app_key
      params[:sign] = sign(app_secret, params)
      params
    end
  
end
