class Main
{

    static function main(mc:MovieClip)
    {
        var FFDK = Object.FFDK = new Object();
        FFDK.toString = function()
        {
            return "[FFDK Object]";
        };

        FFDK.Socket = function(session)
        {
            this._session = session;
            this._status = "closed";
        };
        FFDK.Socket.valueOf = function()
        {
            return "[FFDK.Socket Constructor]";
        };
        FFDK.Socket.prototype.toString = function()
        {
            return "[FFDK.Socket (status=" + this._status + ")]";
        };
        FFDK.Socket.prototype._type = "FFDK.Socket";
        FFDK.Socket.prototype.__proto__ = XMLSocket.prototype;
        FFDK.Socket.prototype.connectXMLSocket = XMLSocket.prototype.connect;
        FFDK.Socket.prototype.closeXMLSocket = XMLSocket.prototype.close;
        FFDK.Socket.prototype.getStatus = function()
        {
            return this._status;
        };
        FFDK.Socket.prototype.getSession = function()
        {
            return this._session;
        };
        FFDK.Socket.prototype.connect = function(host, port)
        {
            this._status = "opening";
            var r = this.connectXMLSocket(host, port);
            if (!r)
            {
                this._status = "closed";
            }
            return r;
        };
        FFDK.Socket.prototype.close = function()
        {
            this._status = "closed";
            this.closeXMLSocket();
        };
        FFDK.Socket.prototype.remove = function()
        {
            this.closeXMLSocket();
            delete this._status;
            delete this._session;
        };
        FFDK.Socket.prototype.onConnect = function(s)
        {
            trace("onConect!");
            if (s)
            {
                this._status = "opened";
                // this._session.onOpen();
            }
            else
            {
                this._status = "closed";
                // var msg = "The socket could not connect to " + this._session.getHost() + ":" + this._session.getPort() + ".";
                // this._session.onOpenFailed(5, msg);
            }
        };
        FFDK.Socket.prototype.onClose = function()
        {
            trace("onClose!");
            if (this._status != "closed")
            {
                this._status = "closed";
                // this._session.onSocketClose();
            }
        };
        FFDK.Socket.prototype.onXML = function(m)
        {
            trace("onXML!");
            trace(m);
        };

        trace("hello, world!");

        var mySocket = new FFDK.Socket();

        mySocket.connect("127.0.0.1", 9000);

    }

}