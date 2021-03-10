
        
     // Func Specialist
        var edit = true;
        var del = true;
        $('.spec').on('click', function() {

            var type = $(this).attr('name');
            if (type == "add") {
                swal("Adding new CN", "Write its name here:", {
                        content: "input",
                        buttons: ["Cancel", true],
                    })
                    .then((value) => {
                        if (value != null) {
                            
                            $.ajax({
                                type: 'POST',
                                url: 'addspec.htm',
                                data: {
                                    value: value,
                                },
                                success: function(d) {
                                	async function sequence() {
                                		  await swal('Oh right',"New Specialist has been created !", 'success');; // Wait 50ms…
                                		  await location.reload(true); // …then wait another 50ms.
                                		 
                                		}
                                	  sequence();
                                	
                                },
                                error: function(e) {
                                    swal('Oops', "Some error happening when adding", "error");
                                }
                            })
                        } else
                            return;

                    });
            }
            if (type == "edit") {
                if (edit) {
                    $('.spec').attr('disabled', 'disabled')
                    $(this).removeAttr('disabled');
                    $('.cn').children('.smallicon').addClass('d-none');
                    $('.cn').children('.edit').removeClass('d-none');
                    edit = !edit;
                } else {
                    $('.spec').removeAttr('disabled');
                    $('.cn').children('.edit').addClass('d-none');
                    edit = !edit;
                }
            }

            if (type == "del")
                if (del) {
                    $('.spec').attr('disabled', 'disabled')
                    $(this).removeAttr('disabled');
                    $('.cn').children('.smallicon').addClass('d-none');
                    $('.cn').children('.exit').removeClass('d-none');
                    del = !del;
                } else {
                    $('.spec').removeAttr('disabled');
                    $('.cn').children('.exit').addClass('d-none');
                    del = !del;
                }
        })
        $('.edit').on('click', function() {
            swal("Updating exsisted CN", "Write its name here:", {
                    content: {
                        element: "input",
                        attributes: {
                            value: $(this).parent().text().split(' ')[0]
                        },
                    },
                    buttons: ["Cancel", true],
                })
                .then((value) => {
                    if (value != null) {

                        var id = $(this).attr('id')
                        console.log(id)
                            // AJAX UPdate CN
                        $.ajax({
                            type: 'POST',
                            url: 'updspec.htm',
                            data: {
                                id: id,
                                value: value,
                            },
                            success: function(d) {
                                async function sequence() {
                          		  await swal('Oh right', value + " has been updated !", 'success');
                                   // Wait 50ms…
                          		  await location.reload(true); // …then wait another 50ms.
                          		 
                          		}
                          	  sequence();
                          	
                            },
                            error: function(e) {
                                swal('Oops', "Some error happening when updatting", "error");
                            }
                        })
                    } else
                        return;
                });
        })
        $('.exit').on('click', function() {
            swal({
                    title: "Are you sure?",
                    text: "Once deleted, you will not be able to recover this data ?",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
                .then((willDelete) => {
                    if (willDelete) {

                        var id = $(this).attr('id')
                            // AJAX DEL CN
                        $.ajax({
                            type: 'POST',
                            url: 'delspec.htm',
                            data: {
                                id: id
                            },
                            success: function(d) {         
                                async function sequence(){
                                	await swal("Poof! Your data has been deleted!", {icon: "success",});
                                	await location.reload(true);
                                	}
                                sequence();
                            },
                            error: function(e) {
                                swal('Oops', "Some error happening when deleting", "error");
                            }
                        })
                    } else {
                        swal("Your data is safe!");
                    }
                });
        })
        
        
        
