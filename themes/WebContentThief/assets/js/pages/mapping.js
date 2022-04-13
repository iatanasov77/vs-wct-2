



$( function ()
{
    $('.boxProjectMapping').each(function() {
        var url = $(this).attr('data-formUrl');
        var data = {
            'processorId': $(this).attr('data-processorId')
        };

        var box = $(this);
        $.get(url, data, function(data) {
            box.html(data);
        });
    });
    
    $('#mappings').on('click', '.btnSaveMappings', function(e) {
        e.preventDefault();
        
        var url = $(this).attr('href');
        var data = $(this).closest('.panel-body').find('select').serialize();
        
        $.post(url, data, function(data) {
            
        });
    });
});
