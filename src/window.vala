/* window.vala
 *
 * Copyright 2022 locness3
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

namespace Getrid {
    [GtkTemplate (ui = "/slay/yass/triakr/eid/window.ui")]
    //public class Window : Adw.ApplicationWindow {
    public class Window : Gtk.ApplicationWindow {
        [GtkChild]
        //private unowned Gtk.Label label;
        private unowned Gtk.Box baseBox;
        private unowned Gtk.HeaderBar header_bar;
        private Gtk.Picture mainPicture;

        public Window (Gtk.Application app) {
            Object (application: app);

            header_bar = (Gtk.HeaderBar) baseBox.get_first_child();

            var mainBox = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 6);
            mainBox.vexpand = true;
            mainPicture = new Gtk.Picture ();
            var testLabel = new Gtk.Label("John Doe");

            //collapse_titlebar();
            load_image();


            baseBox.append(mainBox);
            mainBox.append(mainPicture);
            mainBox.append(testLabel);

            ActionEntry[] action_entries = {
                { "collapse_titlebar", this.collapse_titlebar },
            };
            this.add_action_entries (action_entries, this);
        }

        // https://github.com/maoschanz/drawing/blob/master/src/window.py#L651

        public void collapse_titlebar() {
            baseBox.remove(header_bar);
            set_titlebar(header_bar);
            header_bar.set_show_title_buttons(true);
        }

        private void load_image() {
            // should use gresource
            var imgFile = File.new_for_path("/home/locness3/Projets/GeTrID/src/img_base64.txt");

            imgFile.load_contents_async.begin (null, (obj, res) => {
		        try {
		            string etag_out;
		            uint8[] imgBytes;

		            imgFile.load_contents_async.end (res, out imgBytes, out etag_out);
		            var imgText = (string) imgBytes;
		            var imgData = GLib.Base64.decode (imgText);
		            var loader = new Gdk.PixbufLoader.with_mime_type("image/png");
		            loader.write(imgData);
		            var imgBuf = loader.get_pixbuf();
		            mainPicture.set_pixbuf(imgBuf);
		            //print ("%s", (string) imgText);
		        } catch (Error e) {
			        print ("Error: %s\n", e.message);
		        }
	        });
	    }
    }
}
