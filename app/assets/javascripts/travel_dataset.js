//フォームを追加する場所を判定
function add_place(date,name,kind,button){
  if (document.getElementsByClassName(date+"-place")[0].childNodes.length == 0){
    document.getElementsByClassName(date+"-place")[0].append(buildField(date,name,kind)); 
    document.getElementsByClassName(date+"-add-form-btn")[0].style.display = "none";
  }else{
    const clicked_button = document.getElementById(button.name);
    clicked_button.after(buildField(date,name,kind));
  }
}

//実際にフォームを追加する処理
function buildField(date,name,kind) {
  //タグの定義
  const html = document.createElement("div");
  const title = document.createElement("label");
  const form = document.createElement("input");


  //日時を取得(ユニークなID作成のため)
  const now = new Date();
  const num = Math.floor(Math.random() * 1000);
  const unique_id = String(now.getFullYear())+String((now.getMonth()+1))+String(now.getDate())+String(now.getHours())+String(now.getMinutes())+String(now.getSeconds())+String(num);

  //属性の追加
  html.setAttribute("id", unique_id);

  title.setAttribute("id", "label");
  title.innerHTML = kind+"：";

  form.setAttribute("id", "form")
  form.setAttribute("name", date+"-"+name+"-"+unique_id)

  //挿入するHTMLの構成を作成
  html.append(title,form);
  html.insertAdjacentHTML('beforeend',`<a name="${unique_id}" style="margin-right: 2px;" onclick="add_place('${date}','station','　　駅',this)"><i class="fas fa-bus fa-lg" aria-hidden="true"></i></a>`)
  html.insertAdjacentHTML('beforeend',`<a name="${unique_id}" style="margin-right: 2px;" onclick="add_place('${date}','gourmet','グルメ',this)"><i class="fas fa-utensils fa-lg" aria-hidden="true"></i></a>`)
  html.insertAdjacentHTML('beforeend',`<a name="${unique_id}" style="margin-right: 2px;" onclick="add_place('${date}','sightseeing','観光地',this)"><i class="fas fa-map-location-dot fa-lg" aria-hidden="true"></i></a>`)
  html.insertAdjacentHTML('beforeend',`<a name="${unique_id}" style="margin-right: 2px;" onclick="add_place('${date}','hotel','ホテル',this)"><i class="fas fa-hotel fa-lg" aria-hidden="true"></i></a>`)
  html.insertAdjacentHTML('beforeend',`<a name="${unique_id}" style="margin-right: 2px;" id="${date}" onclick="remove_form(this)"><i class="fas fa-trash fa-lg" aria-hidden="true"></i></a>`)
  return html;
}

//フォームを削除
function remove_form(button){
  const unique_id = button.name;
  document.getElementById(unique_id).remove();

  const date = button.id
  if (document.getElementsByClassName(date+"-place")[0].childNodes.length == 0){
    document.getElementsByClassName(date+"-add-form-btn")[0].style.display = "";
  }
}

//旅行日数にしたがって表示範囲を切り替え
function change_disp(){
  const stay_number = document.getElementById("travel_dataset_stay_number").value;

  for (let i=1; i<8; i++){
    document.getElementById("day"+i).style.display = "none";
  }

  for (let i=1; i<Number(stay_number)+1; i++){
    document.getElementById("day"+i).style.display = "";
  }
}

//入力エリアの表示/非表示
function form_display(button){
  const date = button.name;
  const tag = document.getElementsByClassName(date+"-form_area")[0]

  if(tag.style.display == ""){
    tag.style.display = "none"
  }else{
    tag.style.display = ""
  }
}