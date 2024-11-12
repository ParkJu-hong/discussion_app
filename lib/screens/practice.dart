dynamic temp = {
  'id': 'event1',
  'event_type': 'opinion_added',
  'description': 'A new opinion was added.',
  'created_at': '2024-11-04 15:00',
  'user_id': 'user1',
  'is_agree': true,
  'comments': [
    {'content': 'This is a comment on sub opinion.'},
    {'content': 'This is a comment on sub opinion. 2'},
  ],
  'sub_opinions': [
    {
      'id': 'event1',
      'event_type': 'opinion_added',
      'description': 'A new opinion was added.',
      'created_at': '2024-11-04 15:00',
      'user_id': 'user1',
      'is_agree': true,
      'comments': [
        {'content': 'This is a comment on sub opinion.'},
        {'content': 'This is a comment on sub opinion. 2'},
      ],
      'sub_opinions': [
        {
          'id': 'event1',
          'event_type': 'opinion_added',
          'description': 'A new opinion was added.',
          'created_at': '2024-11-04 15:00',
          'user_id': 'user1',
          'is_agree': true,
          'comments': [
            {'content': 'This is a comment on sub opinion.'},
            {'content': 'This is a comment on sub opinion. 2'},
          ],
          'sub_opinions': [],
        }
      ],
    }
  ],
};
