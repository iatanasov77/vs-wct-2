
export class WctProjectFields
{
    constructor( fields )
    {
        this.fields = fields;
    }
    
    getFields() {
        return this.fields;
    }
    
    addField( field )
    {
        this.fields.push( field );
    }
}

export function initWctProjectFields( fieldsetId )
{
    var page            = fieldsetId == '#fieldsetProjectListingFields' ? 'listing' : 'details';
    var projectFields   = fieldsetId == '#fieldsetProjectListingFields' ? makeListingFieldsObject() : makeDetailsFieldsObject();
    var i               = 0;
    var id              = '';
    
    $( fieldsetId ).find( 'div.row' ).each( function()
    {
        var fieldTitle  = $( this ).find( 'input.fieldTitle' ).val();
        if ( fieldTitle.length ) {
            id  = fieldsetId == '#fieldsetProjectListingFields' ? 
                    'project_form_listingFields_' + i + '_xquery' :
                    'project_form_detailsFields_' + i + '_xquery';
                        
            projectFields.addField({
                id:     id,
                title:  fieldTitle,
                type:   $( this ).find( 'select.fieldType' ).val(),
                xpath:  ( $( this ).find( 'input.fieldXquery' ).val() + '' ).replace(/"/g, '&quot;'),
                page:   page
            });
            
            i++;
        }
    });
    
    return projectFields;
}

function makeListingFieldsObject()
{
    return new WctProjectFields([
        {
            id:     'project_form_listingContainerElement',
            title:  'Listing Container',
            type:   'link',
            xpath:  ( $( '#project_form_listingContainerElement' ).val() + '' ).replace(/"/g, '&quot;'),
            page:   'listing'
        },
        {
            id:     'project_form_detailsLink',
            title:  'Details Link',
            type:   'link',
            xpath:  ( $( '#project_form_detailsLink' ).val() + '' ).replace(/"/g, '&quot;'),
            page:   'listing'
        },
        {
            id:     'project_form_pagerLink',
            title:  'Pager Link',
            type:   'link',
            xpath:  ( $( '#project_form_pagerLink' ).val() + '' ).replace(/"/g, '&quot;'),
            page:   'listing'
        }
    ]);
}

function makeDetailsFieldsObject()
{
    return new WctProjectFields( [] );
}
