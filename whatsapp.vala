using Gtk;
using WebKit;

public class ValaBrowser : Window {

    private const string TITLE = "WhatsApp Web";
    private const string DEFAULT_URL = "http://web.whatsapp.com/";
    private const string DEFAULT_PROTOCOL = "http";

    private Regex protocol_regex;
    private WebView web_view;

    public ValaBrowser () {
        set_default_size (1280, 800);
        this.set_title(TITLE);

        try {
            this.protocol_regex = new Regex (".*://.*");
        } catch (RegexError e) {
            critical ("%s", e.message);
        }

        create_widgets ();
    }

    private void create_widgets () {
        this.web_view = new WebView ();
        var scrolled_window = new ScrolledWindow (null, null);
        scrolled_window.set_policy (PolicyType.AUTOMATIC, PolicyType.AUTOMATIC);
        scrolled_window.add (this.web_view);
        var box = new Box (Gtk.Orientation.VERTICAL, 0);
        box.pack_start (scrolled_window, true, true, 0);
        add (box);
    }

    public void start () {
        show_all ();
        this.web_view.load_uri (DEFAULT_URL);
    }

    public static int main (string[] args) {
        Gtk.init (ref args);

        var browser = new ValaBrowser ();
        browser.start ();

        Gtk.main ();

        return 0;
    }
}
