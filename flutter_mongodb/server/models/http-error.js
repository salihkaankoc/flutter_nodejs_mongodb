class HttpError extends Error{
    constructor(message, errorCode){
        super(message);
        this.code = errorCode;
    }
}


module.expors = HttpError;