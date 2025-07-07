import functions_framework

@functions_framework.http
def hello_http(request):
    """
    HTTP Cloud Function that returns a personalized greeting based on user input.

    Args:
        request (flask.Request): The HTTP request object.
    Returns:
        str: Greeting message.
    """
    # Try to get JSON body
    request_json = request.get_json(silent=True)
    # Try to get query parameters
    request_args = request.args

    # Extract 'name' from either JSON or query parameters
    if request_json and 'name' in request_json:
        name = request_json['name']
    elif request_args and 'name' in request_args:
        name = request_args['name']
    else:
        name = 'OZ'  # default value

    return f"Deploying a Cloud Run Function here, {name}!"
