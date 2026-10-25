<?php
require_once __DIR__ . '/../config.php';

$data = cms_data();

if (!isset($data['settings'])) {
    $data['settings'] = [
        'site_name' => 'Salam Properties',
        'site_title' => 'Salam Properties — Real Estate & Construction',
        'company_email' => 'info@salmaproperties.com.bd',
        'company_phone' => '+(084) 123 - 456 88',
        'company_address' => '401 Broadway, 24th Floor, Orchard View, London',
        'company_about' => 'We are creators of transformative spaces that inspire, innovate, and endure.',
        'copyright_text' => '© 2026 Salam Properties. All Rights Reserved.',
        'facebook_url' => 'https://facebook.com',
        'twitter_url' => 'https://twitter.com',
        'instagram_url' => 'https://instagram.com',
        'linkedin_url' => 'https://linkedin.com',
        'site_logo' => 'assets/images/Logo_Four.png',
        'admin_logo' => 'assets/images/Logo_Four.png'
    ];
}

if (!isset($data['property_types'])) {
    $data['property_types'] = [
        ['id' => 1, 'name' => 'Residential', 'icon' => 'bi-houses', 'status' => 'active'],
        ['id' => 2, 'name' => 'Commercial', 'icon' => 'bi-building', 'status' => 'active'],
        ['id' => 3, 'name' => 'Apartment', 'icon' => 'bi-building-fill', 'status' => 'active'],
        ['id' => 4, 'name' => 'Villa', 'icon' => 'bi-house-heart', 'status' => 'active'],
        ['id' => 5, 'name' => 'Office Space', 'icon' => 'bi-briefcase', 'status' => 'active'],
        ['id' => 6, 'name' => 'Land & Plot', 'icon' => 'bi-geo-alt', 'status' => 'active']
    ];
}

if (!isset($data['locations'])) {
    $data['locations'] = [
        ['id' => 1, 'name' => 'Gulshan, Dhaka', 'country' => 'Bangladesh', 'status' => 'active'],
        ['id' => 2, 'name' => 'Banani, Dhaka', 'country' => 'Bangladesh', 'status' => 'active'],
        ['id' => 3, 'name' => 'Dhanmondi, Dhaka', 'country' => 'Bangladesh', 'status' => 'active'],
        ['id' => 4, 'name' => 'Uttara, Dhaka', 'country' => 'Bangladesh', 'status' => 'active'],
        ['id' => 5, 'name' => 'Bashundhara R/A, Dhaka', 'country' => 'Bangladesh', 'status' => 'active'],
        ['id' => 6, 'name' => 'London, UK', 'country' => 'United Kingdom', 'status' => 'active']
    ];
}

if (!isset($data['properties'])) {
    $data['properties'] = [
        [
            'id' => 1,
            'title' => 'Salam Luxury Residency',
            'type' => 'Apartment',
            'location' => 'Gulshan, Dhaka',
            'price' => '৳ 3.5 Crore',
            'beds' => 4,
            'baths' => 4,
            'area' => '3,200 sqft',
            'image' => 'assets/images/project_9.jpg',
            'featured' => 1,
            'status' => 'active',
            'description' => 'Exclusive luxury modern apartment located in the prime zone of Gulshan with panoramic city views and world-class amenities.'
        ],
        [
            'id' => 2,
            'title' => 'Salam Corporate Tower',
            'type' => 'Commercial',
            'location' => 'Banani, Dhaka',
            'price' => '৳ 8.2 Crore',
            'beds' => 0,
            'baths' => 6,
            'area' => '6,500 sqft',
            'image' => 'assets/images/project_6.jpg',
            'featured' => 1,
            'status' => 'active',
            'description' => 'Grade-A corporate office building designed with sustainable architecture, high-speed elevators, and ample parking facilities.'
        ],
        [
            'id' => 3,
            'title' => 'Lakeview Serene Villa',
            'type' => 'Villa',
            'location' => 'Bashundhara R/A, Dhaka',
            'price' => '৳ 5.8 Crore',
            'beds' => 5,
            'baths' => 6,
            'area' => '4,800 sqft',
            'image' => 'assets/images/project_5.jpg',
            'featured' => 1,
            'status' => 'active',
            'description' => 'Peaceful lakeside duplex villa surrounded by lush greenery, private rooftop pool and garden.'
        ],
        [
            'id' => 4,
            'title' => 'Green View Modern Residence',
            'type' => 'Residential',
            'location' => 'Dhanmondi, Dhaka',
            'price' => '৳ 2.9 Crore',
            'beds' => 3,
            'baths' => 3,
            'area' => '2,400 sqft',
            'image' => 'assets/images/project_2.jpg',
            'featured' => 0,
            'status' => 'active',
            'description' => 'Contemporary residential family apartments equipped with modern fitness center, kids play zone, and rooftop community center.'
        ]
    ];
}

if (!isset($data['inquiries'])) {
    $data['inquiries'] = [
        [
            'id' => 1,
            'name' => 'Tareq Rahman',
            'email' => 'tareq.rahman@gmail.com',
            'phone' => '+880 1712 345678',
            'subject' => 'Inquiry for Salam Luxury Residency',
            'message' => 'I would like to arrange a site visit this coming Saturday for the 4-bedroom apartment.',
            'date' => '2026-10-21 14:30',
            'status' => 'new'
        ],
        [
            'id' => 2,
            'name' => 'Engr. Mahbub Hasan',
            'email' => 'mahbub.hasan@yahoo.com',
            'phone' => '+880 1819 876543',
            'subject' => 'Floor Plan for Commercial Tower',
            'message' => 'Please provide the architectural floor layout and per sqft booking rates.',
            'date' => '2026-10-20 11:15',
            'status' => 'contacted'
        ]
    ];
}

cms_save($data);
echo "CMS initialized successfully!\n";
