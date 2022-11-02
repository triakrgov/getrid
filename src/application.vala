/* application.vala
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
    //public class Application : Adw.Application {
    public class Application : Gtk.Application {
        public Application () {
            Object (application_id: "slay.yass.triakr.eid", flags: ApplicationFlags.FLAGS_NONE);
        }

        construct {
            ActionEntry[] action_entries = {
                { "about", this.on_about_action },
                { "preferences", this.on_preferences_action },
                { "quit", this.quit }
            };
            this.add_action_entries (action_entries, this);
            this.set_accels_for_action ("app.quit", {"<primary>q"});
        }

        public override void activate () {
            base.activate ();
            var win = this.active_window;
            if (win == null) {
                win = new Getrid.Window (this);
            }
            win.present ();
        }

        private void on_titlebar_collapse_action () {
            var win = (Getrid.Window) this.active_window;
            if (win != null) {
                win.collapse_titlebar();
            }
        }

        private void on_about_action () {
            string[] developers = { "locness3" };
            var about = new Adw.AboutWindow () {
                transient_for = this.active_window,
                application_name = "Triakr eID Reader",
                application_icon = "slay.yass.triakr.eid",
                developer_name = "locness3",
                version = "0.1.0",
                developers = developers,
                copyright = "🄯 2022 locness3",
            };

            about.present ();
        }

        private void on_preferences_action () {
            message ("app.preferences action activated");
        }
    }
}
