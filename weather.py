#!/usr/bin/env python2

import os

import requests

BASE = ('http://api.openweathermap.org/data/2.5/weather?zip={zip_code},us'
        '&appid={api_key}')

if __name__ == '__main__':
    from argparse import ArgumentParser
    from pprint import pprint

    parser = ArgumentParser()
    parser.add_argument('--api-key')
    parser.add_argument('--zip-code')
    args = parser.parse_args()

    zip_code = args.zip_code or os.getenv('ZIP_CODE')
    api_key = args.api_key or os.getenv('OPENWEATHERMAP_API_KEY')

    url = BASE.format(api_key=api_key, zip_code=zip_code)

    resp = requests.get(url)
    data = resp.json()

    if data['cod'] != 200:
        print 'error (%d)' % data['cod']
        exit()

    desc = data['weather'][0]['main']
    temp = data['main']['temp'] - 273

    print '%.02fC/%s' % (temp, desc)

