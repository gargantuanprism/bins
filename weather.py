#!/usr/bin/env python2

import requests

YQL = 'select item.condition from weather.forecast where woeid = %s and u = "c"'

BASE = 'https://query.yahooapis.com/v1/public/yql?q={0}&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys'

if __name__ == '__main__':
    from argparse import ArgumentParser
    from pprint import pprint

    parser = ArgumentParser()
    parser.add_argument('woeid')
    args = parser.parse_args()

    url = BASE.format(YQL % args.woeid)

    resp = requests.get(url)
    data = resp.json()

    current = data['query']['results']['channel']['item']['condition']
    print '%sC/%s' % (current['temp'], current['text'])

