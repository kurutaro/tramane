async function get_info(){
  const store_id = document.getElementById("hotpepper_id").value;
  const api_url = "https://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=668ee8d40ef07f50&id=" + store_id + '&format=json'

  const res = await fetch(api_url);
  
  if (!res.ok) {
    throw new Error(`${res.status} ${res.statusText}`);
  }

  const data = await res.text();
  const obj = JSON.parse(data)

  console.log(JSON.stringify(obj, null, 2));

  // ホットペッパーより取得した情報をフォームへ入力
  document.getElementById("food_name").value = obj.results.shop[0].name
  document.getElementById("food_address").value = obj.results.shop[0].address
  document.getElementById("food_url").value = obj.results.shop[0].urls.pc
  document.getElementById("food_large_area").value = obj.results.shop[0].large_service_area.name
  document.getElementById("food_prefecture").value = obj.results.shop[0].large_area.name
  document.getElementById("food_middle_area").value = obj.results.shop[0].middle_area.name
  document.getElementById("food_station").value = obj.results.shop[0].station_name
  document.getElementById("food_description").value = obj.results.shop[0].access
  document.getElementById("food_genle").value = obj.results.shop[0].genre.catch
  document.getElementById("food_sub_genle").value = obj.results.shop[0].sub_genre.name
  document.getElementById("food_budget").value = obj.results.shop[0].budget.average
  document.getElementById("food_open").value = obj.results.shop[0].open
  document.getElementById("food_access").value = obj.results.shop[0].mobile_access
  document.getElementById("food_parking").value = obj.results.shop[0].parking
  document.getElementById("food_logo").value = obj.results.shop[0].logo_image
  document.getElementById("food_photo").value = obj.results.shop[0].photo.pc.l
}