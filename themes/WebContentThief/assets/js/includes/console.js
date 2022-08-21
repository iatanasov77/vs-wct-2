
export const appendMessage = ( containerId, message ) => {
    message = '<p>' + message + '</p>';
    $( containerId ).append( message ).animate( {scrollTop: $( containerId ).prop( "scrollHeight" ) }, 0 );
}
