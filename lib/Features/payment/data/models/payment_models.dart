class CheckoutSession {
  final String id;
  final int amountSubtotal;
  final int amountTotal;
  final String currency;
  final String cancelUrl;
  final String? clientReferenceId;
  final CustomerDetails? customerDetails;
  final String? customerEmail;
  final int expiresAt;
  final Metadata metadata;
  final String mode;
  final String paymentStatus;
  final String status;
  final String successUrl;
  final String url;

  CheckoutSession({
    required this.id,
    required this.amountSubtotal,
    required this.amountTotal,
    required this.currency,
    required this.cancelUrl,
    this.clientReferenceId,
    this.customerDetails,
    this.customerEmail,
    required this.expiresAt,
    required this.metadata,
    required this.mode,
    required this.paymentStatus,
    required this.status,
    required this.successUrl,
    required this.url,
  });

  factory CheckoutSession.fromJson(Map<String, dynamic> json) {
    return CheckoutSession(
      id: json['id'],
      amountSubtotal: json['amount_subtotal'],
      amountTotal: json['amount_total'],
      currency: json['currency'],
      cancelUrl: json['cancel_url'],
      clientReferenceId: json['client_reference_id'],
      customerDetails: json['customer_details'] != null
          ? CustomerDetails.fromJson(json['customer_details'])
          : null,
      customerEmail: json['customer_email'],
      expiresAt: json['expires_at'],
      metadata: Metadata.fromJson(json['metadata']),
      mode: json['mode'],
      paymentStatus: json['payment_status'],
      status: json['status'],
      successUrl: json['success_url'],
      url: json['url'],
    );
  }
}

class CustomerDetails {
  final String? email;
  final String? name;
  final String? phone;

  CustomerDetails({this.email, this.name, this.phone});

  factory CustomerDetails.fromJson(Map<String, dynamic> json) {
    return CustomerDetails(
      email: json['email'],
      name: json['name'],
      phone: json['phone'],
    );
  }
}

class Metadata {
  final String duration;
  final String goal;
  final String platformFee;
  final String providerId;
  final String servicerProviderIncome;

  Metadata({
    required this.duration,
    required this.goal,
    required this.platformFee,
    required this.providerId,
    required this.servicerProviderIncome,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) {
    return Metadata(
      duration: json['duration'],
      goal: json['goal'],
      platformFee: json['platformFee'],
      providerId: json['providerId'],
      servicerProviderIncome: json['servicerProviderIncome'],
    );
  }
}
