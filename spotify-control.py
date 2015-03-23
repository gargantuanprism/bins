#!/usr/bin/env python2

from dbus import glib
import dbus
import sys

class SpotifyController:
    DEST   = 'org.mpris.MediaPlayer2.spotify'
    PROPS  = 'org.freedesktop.DBus.Properties'
    PATH   = '/org/mpris/MediaPlayer2'
    PLAYER = 'org.mpris.MediaPlayer2.Player'

    TIMEOUT = 5000

    def __init__(self):
        glib.init_threads()

        try:
            self.__obj = dbus.SessionBus().get_object(self.DEST, self.PATH)
            self.__player = dbus.Interface(self.__obj, self.PLAYER)
            self.__props = dbus.Interface(self.__obj, self.PROPS)
        except:
            sys.stderr.write("Spotify is not running\n")
            exit(1)

    def get(self, prop):
        return self.__props.Get(self.PLAYER, 'Metadata')[prop]

    def title(self):
        return self.get('xesam:title')

    def artist(self):
        return ', '.join(self.get('xesam:artist'))

    def album(self):
        return self.get('xesam:album')

    def track(self):
        return self.get('xesam:trackNumber')

    def full_title(self):
        return '%s - %s' % (self.artist(), self.title())

    def full_info(self):
        return (self.full_title(), self.album_info())

    def album_info(self):
        return '%s, track %d' % (self.album(), self.track())

    def play_pause(self):
        self.__player.PlayPause()

        return self.full_info()

    def stop(self):
        self.__player.Stop()

    def next(self):
        self.__player.Next()

        return self.full_info()

    def prev(self):
        self.__player.Previous()

        return self.full_info()

if __name__ == '__main__':
    s = SpotifyController()

    result = getattr(s, sys.argv[1])()

    if result is not None:
        print result
    #     Notify.init(s.__class__.__name__)
        
    #     note = Notify.Notification.new(result[0], result[1], None)
    #     note.set_timeout(SpotifyController.TIMEOUT)
    #     note.show()
