const resource = GetParentResourceName();
var formatMoney = "es-ES"
var indexBtn = 1;

async function fetchNui(eventName, data) {
  const resp = await fetch(`https://${resource}/${eventName}`, {
    method: 'post',
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: JSON.stringify(data),
  });

  return await resp.json();
}

function clickBtn(btn){
    $(btn).addClass("click");
    setTimeout(() => {
        $(btn).removeClass("click");
    }, 150);
}

function updatePrice(price){
    let totalPrice = new Intl.NumberFormat(formatMoney, { maximumFractionDigits: 1, minimumFractionDigits: 1 }).format(parseFloat(price))
    $("#price").text(totalPrice)
}

function translate(lang){
    $("#free").text(lang.free);
    $("#occupied").text(lang.occupied);
    $("#stopped").text(lang.stopped);
    $("#rateLabel").text(lang.rate);
    $("#labelBtn1").text(lang.num1);
    $("#labelBtn2").text(lang.num2);
    $("#labelBtn3").text(lang.num3);
    $("#labelBtn4").text(lang.num4);
    $("#labelBtn5").text(lang.num5);
    $("#labelBtn6").text(lang.num6);
    $("#labelBtn7").text(lang.num7_stop);
    $("#labelBtn8").text(lang.num8_reset);
    $("#currency").text(lang.currency);
    $("#distance").text(lang.distance);
}
function reloadConfig(){
    fetchNui("initialConfig", [])
}

$(function() {
    
    window.addEventListener("message", function(ev) {
        switch (ev.data.type) {
            case "menuOpacityActive":
                $("#meter").addClass("menuOpen")
            break;
            case "focus_active":
                $($(".buttonsContainer .button")[indexBtn-1]).addClass("focus");
            break;
            case "focus_disable":
                $(".buttonsContainer .button.focus").removeClass("focus");
            break;
            case "left_arrow":
                indexBtn = indexBtn - 1
                if (indexBtn < 1){
                    indexBtn = 8;
                }
                $(".buttonsContainer .button.focus").removeClass("focus");
                $($(".buttonsContainer .button")[indexBtn-1]).addClass("focus");
            break;
            case "right_arrow":
                indexBtn = indexBtn + 1
                if (indexBtn > 8){
                    indexBtn = 1;
                }
                $(".buttonsContainer .button.focus").removeClass("focus");
                $($(".buttonsContainer .button")[indexBtn-1]).addClass("focus");
            break;
            case "enter_btn":
                fetchNui("selectBtn",{numberBtn:indexBtn});
            break;
            case "menuOpacityDisabled":
                $("#meter").removeClass("menuOpen")
            break;
            case "initialData":
                let lang = ev.data.lang;
                translate(lang);
                formatMoney = ev.data.formatMoney;
            break;
            case 'update_total':
                updatePrice(ev.data.price)
            break;
            case 'select_rate':
                $(".status").removeClass("active");
                if(ev.data.rate == 0){
                    $("#rate").text("");
                    $("#free").addClass("active");
                }else{
                    $("#rate").text(ev.data.rate);
                    $("#occupied").addClass("active");
                    if(ev.data.rate > 0 && ev.data.rate < 7){
                    clickBtn("#btn"+ev.data.rate);
                    }
                }
            break;
            case 'pause':
                $(".status").removeClass("active");
                $("#stopped").addClass("active");
                clickBtn("#btn7");
                $("#price").addClass("pause")
            break;
            case 'play':
                $(".status").removeClass("active");
                $("#occupied").addClass("active");
                clickBtn("#btn7");
                $("#price").removeClass("pause");
            break;
            case 'reset':
                clickBtn("#btn8");
                $(".status").removeClass("active");
                $("#rate").text("");
                $("#free").addClass("active");
                $("#price").text("");
            break;
            case 'open':
                $("#meter").show();
            break;
            case 'close':
                $(".buttonsContainer .button.focus").removeClass("focus");
                $("#meter").hide();
            break;
        }
    });
});