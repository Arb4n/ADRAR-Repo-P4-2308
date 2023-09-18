function displayPromptJoinModal(id) {
    $("#modalJoinEvaluation .modal-content").html("");

    $.ajax({
        url: "//" + SERVER_NAME + "/erp_adrar/src/c/requests.php", 
        method: "post",
        data: {
            display_prompt_join_modal: 1, 
            evalId: id
        }, 
        success: function(r) {
            $("#modalJoinEvaluation .modal-content").html(r);
            $("#modalJoinEvaluation").modal("show");
        }, 
        error: function() {
            $("#modalJoinEvaluation").modal("hide");
        }
    });
}

function btnJoinEvaluation(id) {
    $.ajax({
        url: "//" + SERVER_NAME + "/erp_adrar/src/c/requests.php", 
        method: "post",
        data: {
            btn_join_evaluation: 1, 
            evalId: id
        }, 
        success: function(r) {
            $("#modalJoinEvaluation .modal-content").html("");
            location.reload();
            setTimeout(function() {
                location.href = $("#eval_" + id).attr("href");
            }, 1000);
        }
    });
}

function majInputRessource() {
    document.querySelector("#div_form_ressource_file").classList.remove('d-block');
    document.querySelector("#div_form_ressource_file").classList.remove('d-none');
    if(document.querySelector("#form_ressource_type").value !== "autre") {
        document.querySelector("#div_form_ressource_file").classList.add('d-none');
    }
}